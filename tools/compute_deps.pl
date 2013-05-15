#!/usr/bin/env perl -w

use strict;

use Digest::MD5 qw(md5_hex);

my $pkgdir = $ARGV[0];


# compute a version number from dependency versions

sub compute_version {
	my ( $depversions ) = @_;

	my $depstr = "";

	foreach $dep in ( @{$depversions} ) {
		$depstr .= $dep;
	}

	return md5_hex ( $depstr );
}

# get list of packages

sub packages {
	my ( $pdir ) = @_;

	my $pkg = ();

	# get a listing of the directory
	opendir ( DIR, $pdir ) || die ( "\nCannot open package directory $pdir\n\n" );
	my @listing = readdir ( DIR );
	closedir ( DIR );

	my $file;
	foreach $file ( @listing ) {
		if ( ( $file ne "." ) && ( $file ne ".." ) && ( ! ( $file =~ /overrides.*/ ) ) ) {
			my $filepath = $pdir."/".$file;
			if ( -d $filepath ) {
				push ( @{$pkg}, $file );
			}
		}
	}

	return $pkg;
}

# get the version of a package and its (unversioned) dependencies

sub package_info {
	my ( $dir ) = @_;
	my $verfile = $dir."/version";
	my $depsfile = $dir."/deps";

	#FIXME: enforce all packages to have a version file, which may contain "GENERATED"?

	my $version;
	if ( -e $verfile ) {
		open ( IN, $verfile ) || die ( "\nCannot open package version file $verfile\n\n" );
		my $line = <IN>;
		close ( IN );
		my @F = split ( /\s+/, $line );
		$version = $F[0];
	} else {
		$version = "GENERATED";
	}

	my $line;
	open ( IN, $depsfile ) || die ( "\nCannot open package deps file $depsfile\n\n" );
	$line = <IN>;
	close ( IN );
	my $deps = ();
	if ( defined ( $line ) ) {
		@{$deps} = split ( /\s+/, $line );
	}

	return ( $version, $deps );
}


my $pkgs = packages ( $pkgdir );

my $pname;
foreach $pname ( @{$pkgs} ) {
	my $path = $pkgdir."/".$pname;
	print "querying $path\n";
	my $version;
	my $deps;
	( $version, $deps ) = package_info ( $path );
	print "  $version : ";
	my $dbg;
	foreach $dbg (@{$deps}) {
		print "$dbg ";
	}
	print "\n";
}



