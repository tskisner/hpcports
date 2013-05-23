#!/usr/bin/env perl -w

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

# check arguments

my $ARGC = @ARGV;

if ( $ARGC != 2 ) {
	die ( "\nInternal inconsistency in package extraction script!\n\n" );
}

my $pname = $ARGV[0];
my $pysite = $ARGV[1];

# load DB

my $pdb = retrieve ( $dbfile );

# lookup package conflicts

my $conflicts = HPCPorts::package_conflict ( "${pkgdir}/${pname}" );

# load system config

my ( $env, $suffix, $prefix, $overrides ) = HPCPorts::config_vars ( "${hpcp_root}/system/${system}.make" );

# Generate staging files

if ( defined ( $overrides->{ $pname } ) ) {

	HPCPorts::module_file ( "${pname}.module", $pdb, $pname, $overrides->{ $pname }, $conflicts, $env, $suffix, $pysite, "${hpcp_root}/system/${system}.module", $prefix, $overrides );

	HPCPorts::module_version ( "${pname}.modversion", $pname, $overrides->{ $pname }->{ "${pname}_VERSION" }, $env, $suffix );

	HPCPorts::shell_file ( "${pname}.sh", $pdb, $pname, $overrides->{ $pname }, $conflicts, $env, $suffix, $pysite, "${hpcp_root}/system/${system}.sh", $prefix, $overrides );

	open ( VER, ">${pname}.fullversion" ) || die ( "\nCannot write version file ${pname}.fullversion\n\n" );
	print VER $overrides->{ $pname }->{ "${pname}_VERSION" }, $env, "\n";
	close ( VER );

} else {

	my $vars = HPCPorts::package_vars ( "${pkgdir}/${pname}" );

	HPCPorts::module_file ( "${pname}.module", $pdb, $pname, $vars, $conflicts, $env, $suffix, $pysite, "${hpcp_root}/system/${system}.module", $prefix, $overrides );

	if ( $pname eq "hpcp" ) {
		HPCPorts::module_version ( "${pname}.modversion", $pname, $env, $env, $suffix );
	} else {
		HPCPorts::module_version ( "${pname}.modversion", $pname, $pdb->{ $pname }->{ "version" }, $env, $suffix );
	}

	HPCPorts::shell_file ( "${pname}.sh", $pdb, $pname, $vars, $conflicts, $env, $suffix, $pysite, "${hpcp_root}/system/${system}.sh", $prefix, $overrides );

	open ( VER, ">${pname}.fullversion" ) || die ( "\nCannot write version file ${pname}.fullversion\n\n" );
	if ( $pname eq "hpcp" ) {
		print VER $env, "\n";
	} else {
		print VER $pdb->{ $pname }->{ "version" }, "-", $env, "\n";
	}
	close ( VER );

}

HPCPorts::dep_file ( "${pname}_deps.sh", $pdb, $pname, $env, $suffix, $prefix, $overrides );



