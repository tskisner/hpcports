package HPCPorts;

use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION     = 1.00;
@ISA         = qw(Exporter);
@EXPORT      = ();
@EXPORT_OK   = qw( 
					standard_vars 
					hpcp_version
					generate_version
					package_list
					package_info
					package_db
					package_vars
					package_conflict
					config_vars
					module_version
					module_file
				);
%EXPORT_TAGS = ( DEFAULT => [qw()] );

use Digest::MD5 qw(md5_hex);
use Storable;


# Standard package variables.  These can be specified by package overrides.

sub standard_vars {
	my @ret = (
		"BIN",
		"MAN",
		"PYTHON",
		"INCLUDE",
		"DATA",
		"LIB",
		"LIBS_CC",
		"LIBS_CXX",
		"LIBS_F77",
		"LIBS_FC",
		"LIBS_MPICC",
		"LIBS_MPICXX",
		"LIBS_MPIF77",
		"LIBS_MPIFC"
	);
	return @ret;
}


# Get git hash or other string to use as DB versioning

sub hpcp_version {
	my ( $root ) = @_;
	my $gitexec = `which git`;
	my $version;
	if ( $gitexec ne "" ) {
		open ( GIT, "cd ${root}; git rev-parse --short HEAD | " ) || die ( "\nCould not use git command ${gitexec}\n\n");
		$version = <GIT>;
		chomp ( $version );
		close ( GIT );
	} elsif ( -e "${root}/VERSION" ) {
		$version = `head -1 ${root}/VERSION`;
	} else {
		die ( "\nPath \"$root\" is not a git checkout or a distributed source tree\n\n" );
	}
	return $version;
}


# Compute a version number from dependency versions

sub generate_version {
	my ( $depversions ) = @_;

	my $outver = "";

	if ( defined $depversions && ( @{$depversions} > 0 ) ) {
		# use md5 sum of dependency versions

		my $depstr = "";

		my $dep;
		foreach $dep ( @{$depversions} ) {
			$depstr .= $dep;
		}
		my $raw = md5_hex ( $depstr );
		$raw =~ s/(.{8}).*/$1/;
		$outver = $raw;

	}

	return $outver;
}


# Get list of all packages

sub package_list {
	my ( $pdir ) = @_;

	my $pkg = ();

	# get a listing of the directory
	opendir ( DIR, $pdir ) || die ( "\nCannot open package directory $pdir\n\n" );
	my @listing = readdir ( DIR );
	closedir ( DIR );

	my $file;
	foreach $file ( @listing ) {
		if ( ( $file ne "." ) && ( $file ne ".." ) && ( $file ne "hpcp" ) ) {
			my $filepath = $pdir."/".$file;
			if ( -d $filepath ) {
				push ( @{$pkg}, $file );
			}
		}
	}

	return $pkg;
}


# Get version of a package and its (unversioned) dependencies

sub package_info {
	my ( $dir ) = @_;
	my $verfile = $dir."/version";
	my $depsfile = $dir."/deps";

	#FIXME: enforce all packages to have a version file, which may contain "GENERATED"?

	my $version;
	open ( IN, $verfile ) || die ( "\nCannot open package version file $verfile\n\n" );
	my $line = <IN>;
	close ( IN );
	my @F = split ( /\s+/, $line );
	$version = $F[0];

	open ( IN, $depsfile ) || die ( "\nCannot open package deps file $depsfile\n\n" );
	$line = <IN>;
	close ( IN );
	my $deps = ();
	if ( defined ( $line ) ) {
		@{$deps} = split ( /\s+/, $line );
	}

	return ( $version, $deps );
}


# Build a dictionary of all package information, including generated versions
# and dependencies

sub all_deps {
	my ( $pdb, $pname, $curdep ) = @_;

	my $dep;
	for $dep ( @{ $pdb->{ $curdep }->{ "rawdeps" } } ) {
		all_deps ( $pdb, $pname, $dep );
	}
	push ( @{ $pdb->{ $pname }->{ "deps" } }, $curdep );

	return;
}

sub package_db {
	my ( $pdir ) = @_;

	my $tree = {};

	my $pkgs = package_list ( $pdir );

	# first determine pre-set package versions and
	# unversioned dependencies.

	my $pname;
	foreach $pname ( @{$pkgs} ) {
		my $path = $pdir."/".$pname;
		my $version;
		my $deps;
		( $version, $deps ) = package_info ( $path );
		$tree->{ $pname } = {};
		$tree->{ $pname }->{ "version" } = $version;
		$tree->{ $pname }->{ "rawdeps" } = $deps;
		$tree->{ $pname }->{ "deps" } = ();
		$tree->{ $pname }->{ "vdeps" } = {};
		$tree->{ $pname }->{ "rdeps" } = ();
	}

	my $key;
	my $value;

	# Recursively expand dependency tree for each package to
	# include the full set of low-level packages.  The order
	# here is important, since we must install packages lower
	# in the dependency tree first.

	while ( ($key, $value) = each %{$tree} ) {
		$pname = $key;

		all_deps ( $tree, $pname, $pname );

		my @unique;
		my $dup;
		my %seen;
		foreach $dup ( @{ $tree->{ $pname }->{ "deps" } } ) {
			if ( $dup ne $pname ) {
				unless ( $seen { $dup } ) {
					push ( @unique, $dup );
					$seen { $dup } = 1;
				}
			}
		}

		@{ $tree->{ $pname }->{ "deps" } } = @unique;
	}

	# Generate package versions based on dependencies.

	my $dogen = 0;

	while ( ($key, $value) = each %{$tree} ) {
		$dogen++;
	}

	my $lastgen;

	while ( $dogen > 0 ) {
		$lastgen = $dogen;

		while ( ($key, $value) = each %{$tree} ) {
			$pname = $key;

			# make sure that no dependencies have generated versions
			my $can_gen = 1;
			my $depvers = ();
			my $dep;
			for $dep ( @{ $value->{ "deps" } } ) {
				if ( $tree->{ $dep }->{ "version" } eq "GENERATED" ) {
					$can_gen = 0;
				} else {
					push ( @{$depvers}, $tree->{ $dep }->{ "version" } );
				}
			}

			# generate the version if possible
			if ( $can_gen ) {

				my $depstring = generate_version ( $depvers );

				if ( $value->{ "version" } eq "GENERATED" ) {
				
					if ( $depstring eq "" ) {
						die ( "\nPackages with generated versions must have at least one dependency\n\n" );
					} else {
						$value->{ "version" } = $depstring;
					}
					

				} else {

					if ( $depstring ne "" ) {
						$value->{ "version" } .= "_".$depstring;
					}

				}
				--$dogen;

			}

		}

		if ( $lastgen == $dogen ) {
			die ( "Unable to recursively resolve generated versions!" );
		}
	}

	# compute dependency versions

	while ( ($key, $value) = each %{$tree} ) {
		$pname = $key;

		my $dep;
		for $dep ( @{ $value->{ "deps" } } ) {
			$value->{ "vdeps" }->{ $dep } = $tree->{ $dep }->{ "version" };
		}
	}

	# compute full list of reverse dependencies

	while ( ($key, $value) = each %{$tree} ) {
		$pname = $key;

		my $dep;
		for $dep ( @{ $value->{ "deps" } } ) {
			push ( @{$tree->{ $dep }->{ "rdeps" }}, $pname );
		}
	}

	return $tree;
}


# Read the variables exported by a package

sub package_vars {
	my ( $dir ) = @_;
	my $varfile = $dir."/vars";

	my $vars = {};

	open ( IN, "$varfile" ) || die ( "\nCannot open package variables file $varfile\n\n" );
	while ( <IN> ) {
		my @F = split;
		$vars->{ $F[0] } = $F[2];
	}
	close ( IN );

	return ( $vars );
}


# Get list of conflicting packages

sub package_conflict {
	my ( $dir ) = @_;
	my $confile = $dir."/conflict";

	my $conflict = ();

	if ( -e $confile ) {
		open ( IN, $confile ) || die ( "\nCannot open package conflict file $confile\n\n" );
		my $line = <IN>;
		close ( IN );

		my @list = split ( /\s+/, $line );
		my $pkg;
		foreach $pkg ( @list ) {
			push ( @{$conflict}, $pkg );
		}
	}

	return ( $conflict );
}


# Get the full version string of a package

sub package_fullversion {
	my ( $pdb, $pname, $env, $overrides ) = @_;

	my $full;

	if ( defined ( $overrides->{ $pname } ) ) {
		$full = $overrides->{ $pname }->{ "${pname}_VERSION" };
		$full .= "-".$env;
	} else {
		if ( $pname eq "hpcp" ) {
			$full = $env;
		} else {
			$full = $pdb->{ $pname }->{ "version" };
			$full .= "-".$env;
		}
	}

	return $full;
}


# Get the state of a (non-overridden) package

sub package_state {
	my ( $pdb, $pdir, $system, $env, $prefix, $overrides ) = @_;

	my $pname = $pdir;
	$pname =~ s/.*\/(.*)/$1/;

	my $fullversion = package_fullversion ( $pdb, $pname, $env, $overrides );

	my $staging = $pdir."/staging_".$system;

	my $installdir = $prefix."/".$pname."-".$fullversion;

	my $state = "";

	if ( -d $installdir ) {
		$state = "installed";
	} else {

		if ( -d $staging ) {
			# check version of staged files to see if they are stale
			
			open ( FULL, "${staging}/${pname}.fullversion" ) || die ( "\nCannot open version file ${staging}/${pname}.fullversion\n\n" );
			my $stageversion = <FULL>;
			chomp ( $stageversion );
			close ( FULL );

			if ( $stageversion ne $fullversion ) {
				$state = "stale";
			} elsif ( -e "${staging}/state.build" ) {
				$state = "built";
			} elsif ( -e "${staging}/state.configure" ) {
				$state = "configured";
			} elsif ( -e "${staging}/state.patch" ) {
				$state = "patched";
			} elsif ( -e "${staging}/state.extract" ) {
				$state = "extracted";
			} else {
				$state = "purged";
			}
		} else {
			$state = "purged";
		}

	}

	return $state;
}


# Read machine-specific variables from the
# Makefile config snippet.

sub config_vars {
	my ( $file ) = @_;

	open ( IN, "$file" ) || die ( "\nCannot open machine config file $file\n\n" );

	my $overrides = {};
	my $env = "";
	my $suffix = "";
	my $prefix = "";

	while ( <IN> ) {
		chomp;
		if ( ( ! /^#.*/ ) && ( $_ ne "" ) ) {
			# (not a comment or empty line)
			my @F = split;
			if ( $F[0] eq "HPCP_ENV" ) {
				$env = $F[2];
			} elsif ( $F[0] eq "HPCP_MOD_SUFFIX" ) {
				$suffix = $F[2];
			} elsif ( $F[0] eq "HPCP_PREFIX" ) {
				$prefix = $F[2];
			} elsif ( /^(.*)_OVERRIDE.*/ ) {
				$overrides->{ $1 } = {};
			} else {
				# scan for package variables
				my $key;
				my $value;
				while ( ($key, $value) = each %{$overrides} ) {
					if ( /^${key}_(.*)/ ) {
						#print "Found $F[0] = $F[2]\n";
						$value->{ $F[0] } = $F[2];
					}
				}
			}
		}
	}

	if ( $env eq "" ) {
		# see if we can get it from the environment
		if ( defined ( $ENV{ "HPCP_ENV" } ) ) {
			$env = $ENV{ "HPCP_ENV" };
		}
	}

	if ( $prefix eq "" ) {
		# see if we can get it from the environment
		if ( defined ( $ENV{ "HPCP_PREFIX" } ) ) {
			$prefix = $ENV{ "HPCP_PREFIX" };
		}
	}

	return ( $env, $suffix, $prefix, $overrides );
}


# Write module version file

sub module_version {
	my ( $outfile, $pname, $version, $hpcpenv, $modsuffix ) = @_;

	open ( OUT, ">$outfile" ) || die ( "\nCannot open module version file $outfile\n\n" );

	print OUT "#%Module###################################################################
####\n";
	print OUT "## version file for ${pname}${modsuffix}\n";
	print OUT "##\n";
	if ( $pname eq "hpcp" ) {
		print OUT "set ModulesVersion      \"${version}\"\n";
	} else {
		print OUT "set ModulesVersion      \"${version}-${hpcpenv}\"\n";
	}

	close ( OUT );
	return;
}


# Write module file

sub module_file {
	my ( $outfile, $pdb, $pname, $vars, $conflicts, $hpcpenv, $modsuffix, $pysite, $sysmod, $prefix, $overrides ) = @_;

	my $fullversion = package_fullversion ( $pdb, $pname, $hpcpenv, $overrides );

	open ( OUT, ">$outfile" ) || die ( "\nCannot open output module file $outfile\n\n" );

	print OUT "#%Module###<-magic cookie ####################################################
##\n";
	print OUT "##   ${pname} \n";
	print OUT "##   HPCPorts module file\n";
	print OUT "##\n";
	print OUT "##\n";
	print OUT "# variables for Tcl script use only\n";
	print OUT "set     version  ${fullversion}\n";
	print OUT "set     prefix   ${prefix}/${pname}-${fullversion}\n";
	print OUT "\n";
	print OUT "module-whatis \"Loads the HPCPorts version of ${pname}\"\n";
	print OUT "\n";

	# Write variables

	print OUT "setenv ${pname}_PREFIX \"${prefix}/${pname}-${fullversion}\"\n";
	print OUT "setenv ${pname}_VERSION \"${fullversion}\"\n\n";

	my $key;
	my $value;
	while ( ($key, $value) = each %{$vars} ) {
		if ( $key eq "BIN" ) {
			print OUT "prepend-path PATH \"${prefix}/${pname}-${fullversion}/${value}\"\n";
		} elsif ( $key eq "MAN" ) {
			print OUT "prepend-path MANPATH \"${prefix}/${pname}-${fullversion}/${value}\"\n";
		} elsif ( $key eq "PYTHON" ) {
			print OUT "prepend-path PYTHONPATH \"${prefix}/${pname}-${fullversion}/${value}/${pysite}/site-packages\"\n";
		} elsif ( $key eq "INCLUDE" ) {
			print OUT "prepend-path CPATH \"${prefix}/${pname}-${fullversion}/${value}\"\n";
		} elsif ( $key eq "LIB" ) {
			print OUT "prepend-path LIBRARY_PATH \"${prefix}/${pname}-${fullversion}/${value}\"\n";
			print OUT "prepend-path LD_LIBRARY_PATH \"${prefix}/${pname}-${fullversion}/${value}\"\n";
		} else {
			print OUT "setenv ${pname}_${key} \"${value}\"\n";
		}
	}

	print OUT "\n";

	# Boilerplate description

	print OUT "proc ModulesHelp { } {\n";
	print OUT "  global version\n";
	print OUT "  puts stderr \"\\\t    ${pname} - Version \$version\\\n\"\n";
	print OUT "  puts stderr \"\\\t This module file was auto-generated for the ${pname}\"\n";
	print OUT "  puts stderr \"\\\t package as part of the HPCPorts installation system.\"\n";
	print OUT "  puts stderr \"\\\t In general, this module may modify the PATH,\"\n";
	print OUT "  puts stderr \"\\\t LD_LIBRARY_PATH, and MANPATH environment variables,\"\n";
	print OUT "  puts stderr \"\\\t as well as setting any variables needed for compiling\"\n";
	print OUT "  puts stderr \"\\\t and linking against libraries in this package.\"\n";
	print OUT "  puts stderr \"\"\n";
	print OUT "}\n";
	print OUT "\n";

	# Conflicts

	print OUT "conflict ${pname}${modsuffix}\n\n";

	my $con;
	for $con (@{$conflicts}) {
		print OUT "conflict ${con}${modsuffix}\n";
	}

	# Add dependencies

	if ( $pname eq "hpcp" ) {
		# special handling of hpcp module

		print OUT "if [ module-info mode load ] {\n";

		open ( SYS, "$sysmod" ) || die ( "\nCannot open system module initialization $sysmod\n\n" );
		while ( <SYS> ) {
			print OUT "\t",$_;
		}
		close ( SYS );

		print OUT "}\n";
		print OUT "\n";

	} else {

		print OUT "if [ module-info mode load ] {\n";
		print OUT "\tif [ is-loaded hpcp ] {\n";
		print OUT "\t} else {\n";
		print OUT "\t\tmodule load hpcp/${hpcpenv}\n";
		print OUT "\t}\n";
		print OUT "}\n";
		print OUT "\n";

		my $dep;
		foreach $dep ( @{ $pdb->{ $pname }->{ "deps" } } ) {
			my $depmod = $dep.$modsuffix;
			my $depver;

			if ( defined $overrides->{ $dep } ) {
				$depver = $overrides->{ $dep }->{ "${dep}_VERSION" };
			} else {
				$depver = $pdb->{ $pname }->{ "vdeps" }->{ $dep };
			}
			$depver .= "-".$hpcpenv;

			print OUT "if [ module-info mode load ] {\n";
			print OUT "\tif [ is-loaded ${depmod} ] {\n";
			print OUT "\t} else {\n";
			print OUT "\t\tmodule load ${depmod}/${depver}\n";
			print OUT "\t}\n";
			print OUT "}\n";
			print OUT "\n";
		}

	}

	close ( OUT );

	return;
}


# Write shell snippet

sub shell_file {
	my ( $outfile, $pdb, $pname, $vars, $conflicts, $hpcpenv, $modsuffix, $pysite, $syssh, $prefix, $overrides ) = @_;

	my $fullversion = package_fullversion ( $pdb, $pname, $hpcpenv, $overrides );

	open ( OUT, ">$outfile" ) || die ( "\nCannot open output shell file $outfile\n\n" );

	print OUT "# This file is auto-generated\n\n";

	# Write variables

	print OUT "export ${pname}_PREFIX=\"${prefix}/${pname}-${fullversion}\"\n";
	print OUT "export ${pname}_VERSION=\"${fullversion}\"\n\n";

	if ( $pname eq "hpcp" ) {
		# special handling of hpcp package

		open ( SYS, "$syssh" ) || die ( "\nCannot open system shell initialization $syssh\n\n" );
		while ( <SYS> ) {
			print OUT $_;
		}
		close ( SYS );

		print OUT "\n";

	} else {

		my $key;
		my $value;
		while ( ($key, $value) = each %{$vars} ) {
			if ( $key eq "BIN" ) {
				print OUT "export PATH=\"${prefix}/${pname}-${fullversion}/${value}:\$PATH\"\n";
			} elsif ( $key eq "MAN" ) {
				print OUT "export MANPATH=\"${prefix}/${pname}-${fullversion}/${value}:\$MANPATH\"\n";
			} elsif ( $key eq "PYTHON" ) {
				print OUT "export PYTHONPATH=\"${prefix}/${pname}-${fullversion}/${value}/${pysite}/site-packages:\$PYTHONPATH\"\n";
			} elsif ( $key eq "INCLUDE" ) {
				print OUT "export CPATH=\"${prefix}/${pname}-${fullversion}/${value}:\$CPATH\"\n";
			} elsif ( $key eq "LIB" ) {
				print OUT "export LIBRARY_PATH=\"${prefix}/${pname}-${fullversion}/${value}:\$LIBRARY_PATH\"\n";
				print OUT "export LD_LIBRARY_PATH=\"${prefix}/${pname}-${fullversion}/${value}:\$LD_LIBRARY_PATH\"\n";
			} else {
				print OUT "export ${pname}_${key}=\"${value}\"\n";
			}
		}
	}

	print OUT "\n";

	close ( OUT );

	return;
}


sub dep_file {
	my ( $outfile, $pdb, $pname, $hpcpenv, $modsuffix, $prefix, $overrides ) = @_;

	open ( OUT, ">$outfile" ) || die ( "\nCannot open output dep file $outfile\n\n" );

	print OUT "# This file is auto-generated\n\n";

	# Add dependencies

	if ( $pname eq "hpcp" ) {
		# special handling of hpcp package

		print OUT "# (hpcp module has no dependencies)\n";

	} else {

		my $dep;
		foreach $dep ( @{ $pdb->{ $pname }->{ "deps" } } ) {
			my $fullversion = package_fullversion ( $pdb, $dep, $hpcpenv, $overrides );

			print OUT "source ${prefix}/env/${dep}_${fullversion}.sh\n";
		}

	}

	close ( OUT );

	return;
}


1;


