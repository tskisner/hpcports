# This is a csh shell compatible resource file that is designed to initialize
# the HPCPorts modules environment.  You should source this file in your
# csh compatible shell resource file, at the very beginning of that file.

setenv NERSC_HOST `/usr/common/usg/bin/nersc_host`

# What shell are we using?
set THISSHELL = `echo $SHELL | sed -r -e 's|.*/(.*)$|\1|'`

# These aliases are ugly, but csh does not support functions.  There 
# is no way to check for the case of missing command line arguments.

alias planckcheck 'groups | sed -e "s#.*\(planck\).*#yes#" | sed -e "s# ##g"'

alias polarcheck 'groups | sed -e "s#.*\(polar\).*#yes#" | sed -e "s# ##g"'


if ( $NERSC_HOST == "hopper" ) then
  # Check to see if the modules init file has already been sourced
  # If not then try to source the init file for this shell.  If that
  # does not exist, source the basic "csh" file.

  if ( ! $?MODULESHOME ) then
    if ( -r /opt/modules/default/init/$THISSHELL ) then
      source /opt/modules/default/init/$THISSHELL
    else
      source /opt/modules/default/init/csh
    endif
  endif

  source /project/projectdirs/cmb/modules/hpcports_NERSC_hopper.csh

endif


if ( $NERSC_HOST == "carver" ) then
  # Check to see if the modules init file has already been sourced
  # If not then try to source the init file for this shell.  If that
  # does not exist, source the basic "csh" file.

  if ( ! $?MODULESHOME ) then
    if ( -r /usr/common/nsg/opt/Modules/default/init/$THISSHELL ) then
      source /usr/common/nsg/opt/Modules/default/init/$THISSHELL
    else
      source /usr/common/nsg/opt/Modules/default/init/csh
    endif
  endif

  source /project/projectdirs/cmb/modules/hpcports_NERSC_carver.csh

endif


if ( $NERSC_HOST == "edison" ) then
  # Check to see if the modules init file has already been sourced
  # If not then try to source the init file for this shell.  If that
  # does not exist, source the basic "csh" file.

  if ( ! $?MODULESHOME ) then
    if ( -r /opt/modules/default/init/$THISSHELL ) then
      source /opt/modules/default/init/$THISSHELL
    else
      source /opt/modules/default/init/csh
    endif
  endif

  source /project/projectdirs/cmb/modules/hpcports_NERSC_edison.csh

endif


# This contains module files which apply to multiple systems
module use /project/projectdirs/cmb/modules/modulefiles


# This is for environment propagation using
# Cray CCM
if ( $?PBS_JOBID ) then
  if ( -e $HOME/.hpcpenv_$PBS_JOBID ) then
    source $HOME/.hpcpenv_$PBS_JOBID
  endif
endif


