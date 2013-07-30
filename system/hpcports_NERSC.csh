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

  alias hpcports 'set planck=`planckcheck` ; module unuse /project/projectdirs/cmb/modules/hopper/hpcports_gnu/env/modulefiles ; module unuse /project/projectdirs/cmb/modules/hopper/hpcports_intel/env/modulefiles ; module unuse /project/projectdirs/planck/modules/hopper/gnu/modulefiles ; module unuse /project/projectdirs/planck/modules/hopper/intel/modulefiles ; eval "switch (\!:1) \\
    case "login": \\
    module use /project/projectdirs/cmb/modules/hopper/hpcports_login/env/modulefiles \\
    breaksw \\
    case "intel": \\
    module use /project/projectdirs/cmb/modules/hopper/hpcports_intel/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/hopper/intel/modulefiles \\
        endif \\
    breaksw \\
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
    echo "usage:  hpcports \[ gnu OR intel OR ccm OR dx9 \]" \\
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

  alias hpcports 'setenv PATH /usr/common/usg/tcsh/6.18.01/bin:$PATH ; setenv SHELL /usr/common/usg/tcsh/6.18.01/bin/tcsh ; set planck=`planckcheck` ; set polar=`polarcheck` ; module unuse /project/projectdirs/cmb/modules/carver/hpcports_gnu/env/modulefiles ; module unuse /project/projectdirs/cmb/modules/carver/hpcports_intel/env/modulefiles ; module unuse /project/projectdirs/planck/modules/carver/gnu/modulefiles ; module unuse /project/projectdirs/planck/modules/carver/intel/modulefiles ; module unuse /project/projectdirs/polar/modules/carver/gnu/modulefiles ; module unuse /project/projectdirs/polar/modules/carver/intel/modulefiles ; eval "switch (\!:1) \\
    case "intel": \\
    module use /project/projectdirs/cmb/modules/carver/hpcports_intel/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/carver/intel/modulefiles \\
        endif \\
        if (x$polar == x"yes") then \\
            module use /project/projectdirs/polar/modules/carver/intel/modulefiles \\
        endif \\
    breaksw \\
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
    echo "usage:  hpcports \[ gnu OR intel \]" \\
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

  alias hpcports 'set planck=`planckcheck` ; module unuse /project/projectdirs/cmb/modules/edison/hpcports_gnu/env/modulefiles ; module unuse /project/projectdirs/cmb/modules/edison/hpcports_intel/env/modulefiles ; module unuse /project/projectdirs/planck/modules/edison/gnu/modulefiles ; module unuse /project/projectdirs/planck/modules/edison/intel/modulefiles ; eval "switch (\!:1) \\
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
    case "ccm": \\
    module use /project/projectdirs/cmb/modules/edison/hpcports_ccm/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/edison/ccm/modulefiles \\
        endif \\
    breaksw \\
    default: \\
    echo "usage:  hpcports \[ gnu OR intel OR ccm OR dx9 \]" \\
    breaksw \\
  endsw"'

endif


# This is for environment propagation using
# Cray CCM
if ( -e $HOME/.hpcpenv_${NERSC_HOST} ) then
  source $HOME/.hpcpenv_$NERSC_HOST
endif


