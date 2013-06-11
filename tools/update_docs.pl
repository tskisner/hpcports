#!/usr/bin/env perl

use strict;
use Storable;
use FindBin;

use lib "$FindBin::Bin";
use HPCPorts;

my $hpcp_root = "$FindBin::Bin/..";
my $pkgdir = $hpcp_root."/packages";
my $dbfile = $pkgdir."/pkg.db";

use HPCPorts;

# check system definition

my $system = $ENV{ "HPCP_HOST" };
if ( ! defined ( $system ) ) {
	die ( "\nYou must have the \"HPCP_HOST\" environment variable defined\n\n" );
}


# load DB

my $pdb = retrieve ( $dbfile );

# load system config

my ( $env, $suffix, $prefix, $overrides ) = HPCPorts::config_vars ( "${hpcp_root}/system/${system}.make" );

# get git revision and update conf.py

my $hpcpver = HPCPorts::hpcp_version ( $hpcp_root );

my $docver = "";
open ( CONF, "${hpcp_root}/docs/source/conf.py" ) || die;
while ( <CONF> ) {
	if ( /^version = .*/ ) {
		my @F = split;
		$docver = $F[2];
	}
}
close ( CONF );

system ( "perl -i -p -e 's/^release =.*/release = \"$docver ($hpcpver)\"/;' ${hpcp_root}/docs/source/conf.py" );

# write rst header

open ( OUT, ">${hpcp_root}/docs/source/pkglist.rst" ) || die;

print OUT ".. _pkglist:\n\n";
print OUT "Current Packages\n";
print OUT "==================================\n\n";
print OUT "At the time of the last documentation update (git revision $hpcpver), the list of availabe packages is found below\n\n";

print OUT "Package List\n";
print OUT "-------------------------\n\n";

# write DOT header

open ( DOT, ">${hpcp_root}/docs/source/deps.dot") || die;

print DOT "digraph HPCPorts {\n";



# print package list

my $key;
my $value;

foreach $key ( sort keys %{$pdb} ) {
	print OUT "* :ref:`${key} <pkg_${key}>`\n";
}

print OUT "\n\n";

print OUT "Package Details\n";
print OUT "-------------------------\n\n";

foreach $key ( sort keys %{$pdb} ) {
	$value = $pdb->{ $key };

	my $version = $pdb->{ $key }->{ "version" };

	print OUT ".. _pkg_${key}:\n\n";
	print OUT "${key}\n";
	print OUT "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n\n";
	print OUT "| Version      : ${version}\n\n";
	print OUT "| Dependencies : \n\n";

	print DOT "${key} [label=\"${key} ${version}\", shape=box];\n";

	my $dep;
	for $dep ( @{ $pdb->{ $key }->{ "deps" } } ) {
		my $depversion = $pdb->{ $dep }->{ "version" };
		print OUT " |   ${dep}  (${depversion})\n";
	}

	print OUT "\n";
}

close ( OUT );

foreach $key ( sort keys %{$pdb} ) {
	$value = $pdb->{ $key };

	print DOT "${key}";

	my $dep;
	for $dep ( @{ $pdb->{ $key }->{ "deps" } } ) {
		print DOT " -> ${dep}";
	}
	print DOT "\n";
}

