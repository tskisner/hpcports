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


if ( $NERSC_HOST == "datatran" ) then
  source /usr/share/Modules/init/${THISSHELL}
endif


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

  alias hpcports 'set planck=`planckcheck` ; module unuse /project/projectdirs/cmb/modules/hopper/hpcports_gnu/env/modulefiles ; module unuse /project/projectdirs/cmb/modules/hopper/hpcports_gnu_dx9/env/modulefiles ; module unuse /project/projectdirs/planck/modules/hopper/gnu/modulefiles ; module unuse /project/projectdirs/planck/modules/hopper/gnu_dx9/modulefiles ; eval "switch (\!:1) \\
    case "gnu": \\
    module use /project/projectdirs/cmb/modules/hopper/hpcports_gnu/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/hopper/gnu/modulefiles \\
        endif \\
    breaksw \\
    case "dx9": \\
    module use /project/projectdirs/cmb/modules/hopper/hpcports_gnu_dx9/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/hopper/gnu_dx9/modulefiles \\
        endif \\
    breaksw \\
    default: \\
    echo "usage:  hpcports \[ gnu OR dx9 \]" \\
    breaksw \\
  endsw"'

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

  alias hpcports 'setenv PATH /usr/common/usg/tcsh/6.18.01/bin:$PATH ; setenv SHELL /usr/common/usg/tcsh/6.18.01/bin/tcsh ; set planck=`planckcheck` ; set polar=`polarcheck` ; module unuse /project/projectdirs/cmb/modules/carver/hpcports_gnu/env/modulefiles ; module unuse /project/projectdirs/cmb/modules/carver/hpcports_gnu_dx9/env/modulefiles ; module unuse /project/projectdirs/planck/modules/carver/gnu/modulefiles ; module unuse /project/projectdirs/planck/modules/carver/gnu_dx9/modulefiles ; module unuse /project/projectdirs/polar/modules/carver/gnu/modulefiles ; eval "switch (\!:1) \\
    case "gnu": \\
    module use /project/projectdirs/cmb/modules/carver/hpcports_gnu/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/carver/gnu/modulefiles \\
        endif \\
        if (x$polar == x"yes") then \\
            module use /project/projectdirs/polar/modules/carver/gnu/modulefiles \\
        endif \\
    breaksw \\
    case "dx9": \\
    module use /project/projectdirs/cmb/modules/carver/hpcports_gnu_dx9/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/carver/gnu_dx9/modulefiles \\
        endif \\
    breaksw \\
    default: \\
    echo "usage:  hpcports \[ gnu OR dx9 \]" \\
    breaksw \\
  endsw" ; tcsh'

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

  alias hpcports 'set planck=`planckcheck` ; set polar=`polarcheck` ; module unuse /project/projectdirs/cmb/modules/edison/hpcports_gnu/env/modulefiles ; module unuse /project/projectdirs/cmb/modules/edison/hpcports_intel/env/modulefiles ; module unuse /project/projectdirs/cmb/modules/edison/hpcports_ccm_gnu/env/modulefiles ; module unuse /project/projectdirs/cmb/modules/edison/hpcports_shared_gnu/env/modulefiles ; module unuse /project/projectdirs/planck/modules/edison/gnu/modulefiles ; module unuse /project/projectdirs/planck/modules/edison/intel/modulefiles ; module unuse /project/projectdirs/planck/modules/edison/ccm_gnu/modulefiles ; module unuse /project/projectdirs/planck/modules/edison/shared_gnu/modulefiles ; module unuse /project/projectdirs/polar/modules/edison/ccm_gnu/modulefiles ; module unuse /project/projectdirs/polar/modules/edison/shared_gnu/modulefiles ; eval "switch (\!:1) \\
    case "intel": \\
    module use /project/projectdirs/cmb/modules/edison/hpcports_intel/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/edison/intel/modulefiles \\
        endif \\
    breaksw \\
    case "gnu": \\
    module use /project/projectdirs/cmb/modules/edison/hpcports_gnu/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/edison/gnu/modulefiles \\
        endif \\
    breaksw \\
    case "ccm_gnu": \\
    module use /project/projectdirs/cmb/modules/edison/hpcports_ccm_gnu/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/edison/ccm_gnu/modulefiles \\
        endif \\
        if (x$polar == x"yes") then \\
            module use /project/projectdirs/polar/modules/edison/ccm_gnu/modulefiles \\
        endif \\
    breaksw \\
    case "shared_gnu": \\
    module use /project/projectdirs/cmb/modules/edison/hpcports_shared_gnu/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/edison/shared_gnu/modulefiles \\
        endif \\
        if (x$polar == x"yes") then \\
            module use /project/projectdirs/polar/modules/edison/shared_gnu/modulefiles \\
        endif \\
    breaksw \\
    default: \\
    echo "usage:  hpcports \[ gnu OR intel OR ccm_gnu OR shared_gnu \]" \\
    breaksw \\
  endsw"'

endif


# This contains module files which apply to multiple systems
module use /project/projectdirs/cmb/modules/modulefiles


# This is for environment propagation using
# Cray CCM
if ( x$PBS_JOBID != x ) then
  if ( -e $HOME/.hpcpenv_$PBS_JOBID ) then
    source $HOME/.hpcpenv_$PBS_JOBID
  endif
endif


