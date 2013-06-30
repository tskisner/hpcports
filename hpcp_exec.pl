#!/usr/bin/env perl

use strict;
use Storable;
use FindBin;

use lib "$FindBin::Bin/tools";
use HPCPorts;


sub purge_stale {
	my ( $pdb, $pname, $root, $system, $env, $prefix, $overrides ) = @_;

	my $pkgdir = "${root}/packages/${pname}";

	my $status;
	if ( defined ( $overrides->{ $pname } ) ) {
		$status = "overridden";
	} else {
		$status = HPCPorts::package_state ( $pdb, "${pkgdir}", $system, $env, $prefix, $overrides );
	}

	if ( $status eq "stale" ) {
		my $fullversion = HPCPorts::package_fullversion ( $pdb, $pname, $env, $overrides );
		system ( "export PKG_FULLVERSION=${fullversion}; cd ${pkgdir}; make purge" );
	}

	return;
}


sub install_list {
	my ( $pdb, $plist, $root, $system, $env, $prefix, $overrides ) = @_;

	# recursively install all dependencies and the package

	my $pname;
	foreach $pname ( @{$plist} ) {

		if ( $pname ne "hpcp" ) {
			purge_stale ( $pdb, "hpcp", $root, $system, $env, $prefix, $overrides );
			system ( "export PKG_FULLVERSION=${env}; cd ${root}/packages/hpcp; make install" );
		}

		my $dep;
		my $fullversion;

		foreach $dep ( @{$pdb->{ $pname }->{ "deps" }} ) {
			purge_stale ( $pdb, $dep, $root, $system, $env, $prefix, $overrides );
			$fullversion = HPCPorts::package_fullversion ( $pdb, $dep, $env, $overrides );
			system ( "export PKG_FULLVERSION=${fullversion}; cd ${root}/packages/${dep}; make install" );
		}

		purge_stale ( $pdb, $pname, $root, $system, $env, $prefix, $overrides );
		$fullversion = HPCPorts::package_fullversion ( $pdb, $pname, $env, $overrides );
		system ( "export PKG_FULLVERSION=${fullversion}; cd ${root}/packages/${pname}; make install" );

	}

	return;
}


my $hpcp_root = $FindBin::Bin;
my $pkgdir = $hpcp_root."/packages";
my $dbfile = $pkgdir."/pkg.db";
my $dbversion = $dbfile.".version";

my $pre = "---> ";

# check system definition

my $system = $ENV{ "HPCP_HOST" };
if ( ! defined ( $system ) ) {
	die ( "\nYou must have the \"HPCP_HOST\" environment variable defined\n\n" );
}

# Parse commands

my $ARGC = @ARGV;

if ( ( $ARGC < 1 ) || ( $ARGV[0] eq "help" ) ) {
	print "\n   Usage:  $0 <command> <option>\n\n";
	print "   Where valid commands and options are:\n";
	print "      help                             : show this screen\n";
	print "      update                           : update package DB\n";
	print "      status                           : status of all packages\n";
	print "      info <package(s)>                : detailed package info\n";
	print "      purge <package(s) or ALL>        : purge extracted source\n";
	print "      install <package(s)>             : install package(s)\n";
	print "      upgrade <package(s) or ALL>      : recompile stale package(s)\n";
	print "      uninstall <package(s) or ALL>    : uninstall package(s)\n";
	print "      fetch <package(s) or ALL>        : fetch package source\n";
	print "      clean <package(s) or ALL>        : clean extracted source\n";
	print "\n";
	exit(0);
}

my $command = shift ( @ARGV );

# Get current version

my $hpcpver = HPCPorts::hpcp_version ( $hpcp_root );

# Compare with DB version

my $dbver = "";
if ( -e $dbversion ) {
	open ( DB, "$dbversion" ) || die ( "\nCannot open DB version file $dbversion\n\n" );
	$dbver = <DB>;
	close ( DB );
	chomp ( $dbver );
}

my $needupdate = 0;
if ( ( $dbver ne $hpcpver ) || ( $command eq "update" ) ) {
	$needupdate = 1;
}

# Update package DB if needed

if ( $needupdate ) {
	my $pkgdb = HPCPorts::package_db ( $pkgdir );
	store ( $pkgdb, $dbfile );
	open ( DB, ">$dbversion" ) || die ( "\nCannot open DB version file $dbversion\n\n" );
	print DB $hpcpver,"\n";
	close ( DB );
}

if ( $command eq "update" ) {
	# we are done...
	exit(0);
}

my $pkgdb = retrieve ( $dbfile );

my ( $env, $suffix, $prefix, $overrides ) = HPCPorts::config_vars ( "${hpcp_root}/system/${system}.make" );

#use Data::Dumper;
#print Dumper ( $pkgdb );

# Execute command

if ( $command eq "status" ) {

	my $out = $pre."---------------------------------------------------------\n";
	print $out;
	$out = $pre."HPCP_HOST = \"".$system."\", HPCP_ENV = \"".$env."\"\n";
	print $out;
	$out = $pre."---------------------------------------------------------\n";
	print $out;
	$out = sprintf ( "%s%16s | %20s |  %s\n", $pre, "Package", "Version", "State" );
	print $out;
	$out = $pre."---------------------------------------------------------\n";
	print $out;

	my $key;
	my $value;

	my $hpcpstat = HPCPorts::package_state ( $pkgdb, "${pkgdir}/hpcp", $system, $env, $prefix, $overrides );
	$out = sprintf ( "%s%16s | %20s |  %s\n", $pre, "hpcp", $env, $hpcpstat );
	print $out;

	foreach $key ( sort keys %{$pkgdb} ) {
		$value = $pkgdb->{ $key };

		my $status = "broken";
		if ( defined ( $overrides->{ $key } ) ) {
			$status = "overridden";
		} else {
			$status = HPCPorts::package_state ( $pkgdb, "${pkgdir}/${key}", $system, $env, $prefix, $overrides );
		}
		$out = sprintf ( "%s%16s | %20s |  %s\n", $pre, $key, $value->{ "version" }, $status );
		print $out;
	}
	
} elsif ( $command eq "purge" ) {

	if ( @ARGV == 0 ) {
		die ( "\nUsage:  $0 purge <package(s) or ALL>\n\n" );
	}

	if ( $ARGV[0] eq "ALL" ) {

		my $key;
		my $value;
		my $fullversion;

		while ( ($key, $value) = each %{$pkgdb} ) {
			$fullversion = HPCPorts::package_fullversion ( $pkgdb, $key, $env, $overrides );
			system ( "export PKG_FULLVERSION=${fullversion}; cd ${hpcp_root}/packages/${key}; make purge" );
		}

		$fullversion = HPCPorts::package_fullversion ( $pkgdb, "hpcp", $env, $overrides );
		system ( "export PKG_FULLVERSION=${fullversion}; cd ${hpcp_root}/packages/hpcp; make purge" );

	} else {

		my $pname;
		foreach $pname ( @ARGV ) {
			my $fullversion = HPCPorts::package_fullversion ( $pkgdb, $pname, $env, $overrides );
			system ( "export PKG_FULLVERSION=${fullversion}; cd ${hpcp_root}/packages/${pname}; make purge" );
		}

	}

} elsif ( $command eq "install" ) {

	if ( @ARGV == 0 ) {
		die ( "\nUsage:  $0 install <package(s)>\n\n" );
	}

	# recursively install all dependencies and the package

	install_list ( $pkgdb, \@ARGV, $hpcp_root, $system, $env, $prefix, $overrides );

} elsif ( $command eq "upgrade" ) {

	if ( @ARGV == 0 ) {
		die ( "\nUsage:  $0 upgrade <package(s)>\n\n" );
	}

	# get a list of all stale packages

	my $stale = ();

	if ( $ARGV[0] eq "ALL" ) {

		my $key;
		my $value;

		while ( ($key, $value) = each %{$pkgdb} ) {
			if ( ! defined ( $overrides->{ $key } ) ) {
				my $status = HPCPorts::package_state ( $pkgdb, "${pkgdir}/${key}", $system, $env, $prefix, $overrides );
				if ( $status eq "stale" ) {
					push ( @{$stale}, $key );
				}
			}
		}

	} else {

		my $pname;
		foreach $pname ( @ARGV ) {
			if ( ! defined ( $overrides->{ $pname } ) ) {
				my $status = HPCPorts::package_state ( $pkgdb, "${pkgdir}/${pname}", $system, $env, $prefix, $overrides );
				if ( $status eq "stale" ) {
					push ( @{$stale}, $pname );
				}
			}
		}

	}

	# recursively install all dependencies and the packages

	install_list ( $pkgdb, $stale, $hpcp_root, $system, $env, $prefix, $overrides );

} elsif ( $command eq "info" ) {

	if ( @ARGV == 0 ) {
		die ( "\nUsage:  $0 info <package(s)>\n\n" );
	}

	my $pname;
	foreach $pname ( @ARGV ) {
		my $fullversion = HPCPorts::package_fullversion ( $pkgdb, $pname, $env, $overrides );

		my $status = "broken";
		if ( defined ( $overrides->{ $pname } ) ) {
			$status = "overridden";
		} else {
			$status = HPCPorts::package_state ( $pkgdb, "${pkgdir}/${pname}", $system, $env, $prefix, $overrides );
		}

		print "$pre\n";
		my $out = sprintf ( "%s%14s  %s\n", $pre, "Name:", $pname );
		print $out;
		$out = sprintf ( "%s%14s  %s\n", $pre, "Version:", $fullversion );
		print $out;
		$out = sprintf ( "%s%14s  %s\n", $pre, "State:", $status );
		print $out;
		$out = sprintf ( "%s%14s\n", $pre, "Dependencies:" );
		print $out;

		my $dep;
		for $dep ( @{ $pkgdb->{ $pname }->{ "deps" } } ) {
			my $depversion = HPCPorts::package_fullversion ( $pkgdb, $dep, $env, $overrides );
			$out = sprintf ( "%s%20s | %s\n", $pre, $dep, $depversion );
			print $out;
		}

		print "$pre\n";
	}

} elsif ( $command eq "uninstall" ) {

	if ( @ARGV == 0 ) {
		die ( "\nUsage:  $0 uninstall <package(s) or ALL>\n\n" );
	}

	if ( $ARGV[0] eq "ALL" ) {

		my $key;
		my $value;
		my $fullversion;

		while ( ($key, $value) = each %{$pkgdb} ) {
			$fullversion = HPCPorts::package_fullversion ( $pkgdb, $key, $env, $overrides );
			system ( "export PKG_FULLVERSION=${fullversion}; cd ${hpcp_root}/packages/${key}; make uninstall" );
		}

		$fullversion = HPCPorts::package_fullversion ( $pkgdb, "hpcp", $env, $overrides );
		system ( "export PKG_FULLVERSION=${fullversion}; cd ${hpcp_root}/packages/hpcp; make uninstall" );

	} else {

		my $pname;
		foreach $pname ( @ARGV ) {
			my $fullversion = HPCPorts::package_fullversion ( $pkgdb, $pname, $env, $overrides );
			system ( "export PKG_FULLVERSION=${fullversion}; cd ${hpcp_root}/packages/${pname}; make uninstall" );
		}
	}

} elsif ( $command eq "fetch" ) {

	if ( @ARGV == 0 ) {
		die ( "\nUsage:  $0 fetch <package(s) or ALL>\n\n" );
	}

	if ( $ARGV[0] eq "ALL" ) {

		my $key;
		my $value;

		while ( ($key, $value) = each %{$pkgdb} ) {
			my $fullversion = HPCPorts::package_fullversion ( $pkgdb, $key, $env, $overrides );
			system ( "export PKG_FULLVERSION=${fullversion}; cd ${hpcp_root}/packages/${key}; make fetch" );
		}

	} else {

		my $pname;
		foreach $pname ( @ARGV ) {
			my $fullversion = HPCPorts::package_fullversion ( $pkgdb, $pname, $env, $overrides );
			system ( "export PKG_FULLVERSION=${fullversion}; cd ${hpcp_root}/packages/${pname}; make fetch" );
		}
	}

} elsif ( $command eq "clean" ) {

	if ( @ARGV == 0 ) {
		die ( "\nUsage:  $0 clean <package(s) or ALL>\n\n" );
	}

	if ( $ARGV[0] eq "ALL" ) {

		my $key;
		my $value;
		my $fullversion;

		while ( ($key, $value) = each %{$pkgdb} ) {
			$fullversion = HPCPorts::package_fullversion ( $pkgdb, $key, $env, $overrides );
			system ( "export PKG_FULLVERSION=${fullversion}; cd ${hpcp_root}/packages/${key}; make clean" );
		}

		$fullversion = HPCPorts::package_fullversion ( $pkgdb, "hpcp", $env, $overrides );
		system ( "export PKG_FULLVERSION=${fullversion}; cd ${hpcp_root}/packages/hpcp; make clean" );

	} else {

		my $pname;
		foreach $pname ( @ARGV ) {
			my $fullversion = HPCPorts::package_fullversion ( $pkgdb, $pname, $env, $overrides );
			system ( "export PKG_FULLVERSION=${fullversion}; cd ${hpcp_root}/packages/${pname}; make clean" );
		}
	}

} else {
	die ( "\nUnknown command \"$command\"\n\n" );
}

