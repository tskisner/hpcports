# This is a bourne shell compatible resource file that is designed to initialize
# the HPCPorts modules environment.  You should source this file in your
# bourne compatible shell resource file, at the very beginning of that file.

export NERSC_HOST=`/usr/common/usg/bin/nersc_host`

# What shell are we using?
THISSHELL=`echo $SHELL | sed -e 's/.*\/\(.*\)$/\1/'`


if [ $NERSC_HOST = "datatran" ]; then
  . /usr/share/Modules/init/${THISSHELL}

fi


if [ $NERSC_HOST = "hopper" ]; then
  # Check to see if the modules init file has already been sourced
  # If not then try to source the init file for this shell.  If that
  # does not exist, source the basic "sh" file.

  if [ "x${MODULESHOME}" = "x" ]; then
    if [ -r /opt/modules/default/init/${THISSHELL} ]; then
      . /opt/modules/default/init/${THISSHELL}
    else
      . /opt/modules/default/init/sh
    fi
  fi

  # Now set the environment switching function
  # unload all toolchain options and load the correct one

  hpcports () {
    planck=`groups | sed -e "s#.*\(planck\).*#yes#" | sed -e "s# ##g"`
    polar=`groups | sed -e "s#.*\(polar\).*#yes#" | sed -e "s# ##g"`
    module unuse /project/projectdirs/cmb/modules/hopper/hpcports_gnu/env/modulefiles
    module unuse /project/projectdirs/cmb/modules/hopper/hpcports_gnu_dx9/env/modulefiles
    if [ "$planck" = "yes" ]; then
      module unuse /project/projectdirs/planck/modules/hopper/gnu/modulefiles
      module unuse /project/projectdirs/planck/modules/hopper/gnu_dx9/modulefiles
    fi
    case $1 in
      dx9 ) module use /project/projectdirs/cmb/modules/hopper/hpcports_gnu_dx9/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use /project/projectdirs/planck/modules/hopper/gnu_dx9/modulefiles
            fi;;
      gnu ) module use /project/projectdirs/cmb/modules/hopper/hpcports_gnu/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use /project/projectdirs/planck/modules/hopper/gnu/modulefiles
            fi;;
        * ) echo "usage:  hpcports [ gnu | dx9 ]";;
    esac
  }  
fi

if [ $NERSC_HOST = "edison" ]; then
  # Check to see if the modules init file has already been sourced
  # If not then try to source the init file for this shell.  If that
  # does not exist, source the basic "sh" file.

  if [ "x${MODULESHOME}" = "x" ]; then
    if [ -r /opt/modules/default/init/${THISSHELL} ]; then
      . /opt/modules/default/init/${THISSHELL}
    else
        . /opt/modules/default/init/sh
    fi
  fi

  # Now set the environment switching function
  # unload all toolchain options and load the correct one

  hpcports () {
    planck=`groups | sed -e "s#.*\(planck\).*#yes#" | sed -e "s# ##g"`
    polar=`groups | sed -e "s#.*\(polar\).*#yes#" | sed -e "s# ##g"`
    module unuse /project/projectdirs/cmb/modules/edison/hpcports_gnu/env/modulefiles
    module unuse /project/projectdirs/cmb/modules/edison/hpcports_ccm_gnu/env/modulefiles
    module unuse /project/projectdirs/cmb/modules/edison/hpcports_shared_gnu/env/modulefiles
    module unuse /project/projectdirs/cmb/modules/edison/hpcports_intel/env/modulefiles
    if [ "$planck" = "yes" ]; then
      module unuse /project/projectdirs/planck/modules/edison/gnu/modulefiles
      module unuse /project/projectdirs/planck/modules/edison/intel/modulefiles
      module unuse /project/projectdirs/planck/modules/edison/ccm_gnu/modulefiles
      module unuse /project/projectdirs/planck/modules/edison/shared_gnu/modulefiles
    fi
    if [ "$polar" = "yes" ]; then
      module unuse /project/projectdirs/polar/modules/edison/shared_gnu/modulefiles
      module unuse /project/projectdirs/polar/modules/edison/ccm_gnu/modulefiles
    fi
    case $1 in
      intel ) module use /project/projectdirs/cmb/modules/edison/hpcports_intel/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use /project/projectdirs/planck/modules/edison/intel/modulefiles
            fi;;
      gnu ) module use /project/projectdirs/cmb/modules/edison/hpcports_gnu/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use /project/projectdirs/planck/modules/edison/gnu/modulefiles
            fi;;
      ccm_gnu ) module use /project/projectdirs/cmb/modules/edison/hpcports_ccm_gnu/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use /project/projectdirs/planck/modules/edison/ccm_gnu/modulefiles
            fi
            if [ "$polar" = "yes" ]; then
              module use /project/projectdirs/polar/modules/edison/ccm_gnu/modulefiles
            fi;;
      shared_gnu ) module use /project/projectdirs/cmb/modules/edison/hpcports_shared_gnu/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use /project/projectdirs/planck/modules/edison/shared_gnu/modulefiles
            fi
            if [ "$polar" = "yes" ]; then
              module use /project/projectdirs/polar/modules/edison/shared_gnu/modulefiles
            fi;;
      ccm_intel ) module use /project/projectdirs/cmb/modules/edison/hpcports_ccm_intel/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use /project/projectdirs/planck/modules/edison/ccm_intel/modulefiles
            fi;;
        * ) echo "usage:  hpcports [ gnu | intel | shared_gnu | ccm_gnu ]";;
    esac
  }
fi


if [ $NERSC_HOST = "carver" ]; then
  # Check to see if the modules init file has already been sourced
  # If not then try to source the init file for this shell.  If that
  # does not exist, source the basic "sh" file.

  if [ "x${MODULESHOME}" = "x" ]; then
    if [ -r /usr/common/nsg/opt/Modules/default/init/${THISSHELL} ]; then
      . /usr/common/nsg/opt/Modules/default/init/${THISSHELL}
    else
        . /usr/common/nsg/opt/Modules/default/init/sh
    fi
  fi

  # Now set the environment switching function
  # unload all toolchain options and load the correct one

  hpcports () {
    export MODULE_VERSION="3.2.10"
    if [ -r /project/projectdirs/cmb/modules/carver/Modules/${MODULE_VERSION}/init/${THISSHELL} ]; then
      source /project/projectdirs/cmb/modules/carver/Modules/${MODULE_VERSION}/init/${THISSHELL}
    else
      source /project/projectdirs/cmb/modules/carver/Modules/${MODULE_VERSION}/init/sh
    fi
    planck=`groups | sed -e "s#.*\(planck\).*#yes#" | sed -e "s# ##g"`
    polar=`groups | sed -e "s#.*\(polar\).*#yes#" | sed -e "s# ##g"`
    module unuse /project/projectdirs/cmb/modules/carver/hpcports_gnu/env/modulefiles
    module unuse /project/projectdirs/cmb/modules/carver/hpcports_gnu_dx9/env/modulefiles
    if [ "$planck" = "yes" ]; then
      module unuse /project/projectdirs/planck/modules/carver/gnu/modulefiles
      module unuse /project/projectdirs/planck/modules/carver/gnu_dx9/modulefiles
    fi
    if [ "$polar" = "yes" ]; then
      module unuse /project/projectdirs/polar/modules/carver/gnu/modulefiles
    fi
    case $1 in
      gnu ) module use /project/projectdirs/cmb/modules/carver/hpcports_gnu/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use /project/projectdirs/planck/modules/carver/gnu/modulefiles
            fi
            if [ "$polar" = "yes" ]; then
              module use /project/projectdirs/polar/modules/carver/gnu/modulefiles
            fi;;
      dx9 ) module use /project/projectdirs/cmb/modules/carver/hpcports_gnu_dx9/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use /project/projectdirs/planck/modules/carver/gnu_dx9/modulefiles
            fi;;
        * ) echo "usage:  hpcports [ gnu | intel | dx9 ]";;
    esac
  }
fi


if [ $NERSC_HOST = "scigate" ]; then
  # Check to see if the modules init file has already been sourced
  # If not then try to source the init file for this shell.  If that
  # does not exist, source the basic "sh" file.

  if [ "x${MODULESHOME}" = "x" ]; then
    if [ -r /usr/share/Modules/default/init/${THISSHELL} ]; then
      . /usr/share/Modules/default/init/${THISSHELL}
    else
        . /usr/share/Modules/default/init/sh
    fi
  fi

  # Now set the environment switching function
  # unload all toolchain options and load the correct one

  hpcports () {
    export MODULE_VERSION="3.2.10"
    if [ -r /project/projectdirs/cmb/modules/sgn/Modules/${MODULE_VERSION}/init/${THISSHELL} ]; then
      source /project/projectdirs/cmb/modules/sgn/Modules/${MODULE_VERSION}/init/${THISSHELL}
    else
      source /project/projectdirs/cmb/modules/sgn/Modules/${MODULE_VERSION}/init/sh
    fi
    planck=`groups | sed -e "s#.*\(planck\).*#yes#" | sed -e "s# ##g"`
    polar=`groups | sed -e "s#.*\(polar\).*#yes#" | sed -e "s# ##g"`
    module unuse /project/projectdirs/cmb/modules/sgn/hpcports/env/modulefiles
    if [ "$planck" = "yes" ]; then
      echo "" > /dev/null
      #module unuse /project/projectdirs/planck/modules/sgn/gnu/modulefiles
    fi
    if [ "$polar" = "yes" ]; then
      echo "" > /dev/null
      #module unuse /project/projectdirs/polar/modules/sgn/gnu/modulefiles
    fi
    module use /project/projectdirs/cmb/modules/sgn/hpcports/env/modulefiles
    if [ "$planck" = "yes" ]; then
      echo "" > /dev/null
      #module use /project/projectdirs/planck/modules/sgn/gnu/modulefiles
    fi
    if [ "$polar" = "yes" ]; then
      echo "" > /dev/null
      #module use /project/projectdirs/polar/modules/sgn/gnu/modulefiles
    fi
  }
fi


# This contains module files which apply to multiple systems
module use /project/projectdirs/cmb/modules/modulefiles


# This is for environment propagation using
# Cray CCM
if [ "x${PBS_JOBID}" != x ]; then
  if [ -e $HOME/.hpcpenv_${PBS_JOBID} ]; then
    source $HOME/.hpcpenv_${PBS_JOBID}
  fi
fi

