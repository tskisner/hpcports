# This is a bourne shell compatible resource file that is designed to initialize
# the HPCPorts modules environment.  You should source this file in your
# bourne compatible shell resource file, at the very beginning of that file.

if [ "x${NERSC_HOST}" = "x" ]; then
    export NERSC_HOST=`/usr/common/usg/bin/nersc_host`
fi

# What shell are we using?
THISSHELL=`echo $SHELL | sed -e 's/.*\/\(.*\)$/\1/'`


if [ "x${NERSC_HOST}" = "xdatatran" ]; then

  # Check to see if the modules init file has already been sourced
  # If not then try to source the init file for this shell.  If that
  # does not exist, source the basic "sh" file.

  if [ "x${MODULESHOME}" = "x" ]; then
    if [ -r /usr/share/Modules/init/${THISSHELL} ]; then
      . /usr/share/Modules/init/${THISSHELL}
    else
        . /usr/share/Modules/init/sh
    fi
  fi

  # Now set the environment switching function
  # unload all toolchain options and load the correct one

  hpcports () {
    module use /project/projectdirs/cmb/modules/dtn/hpcports/env/modulefiles
  }
fi


if [ "x${NERSC_HOST}" = "xhopper" ]; then
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
    module unuse /project/projectdirs/cmb/modules/hopper/hpcports_shared_gnu/env/modulefiles
    module unuse /project/projectdirs/cmb/modules/hopper/hpcports_gnu/env/modulefiles
    module unuse /project/projectdirs/cmb/modules/hopper/hpcports_gnu_dx9/env/modulefiles
    if [ "$planck" = "yes" ]; then
      module unuse /project/projectdirs/planck/modules/hopper/shared_gnu/modulefiles
      module unuse /project/projectdirs/planck/modules/hopper/gnu/modulefiles
      module unuse /project/projectdirs/planck/modules/hopper/gnu_dx9/modulefiles
    fi
    if [ "$polar" = "yes" ]; then
      module unuse /project/projectdirs/polar/modules/hopper/shared_gnu/modulefiles
      module unuse /project/projectdirs/polar/modules/hopper/gnu/modulefiles
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
      shared_gnu ) module use /project/projectdirs/cmb/modules/hopper/hpcports_shared_gnu/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use /project/projectdirs/planck/modules/hopper/shared_gnu/modulefiles
            fi
            if [ "$polar" = "yes" ]; then
              module use /project/projectdirs/polar/modules/hopper/shared_gnu/modulefiles
            fi;;
        * ) echo "usage:  hpcports [ shard_gnu | gnu | dx9 ]";;
    esac
  }  
fi

if [ "x${NERSC_HOST}" = "xedison" ]; then
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


if [ "x${NERSC_HOST}" = "xcarver" ]; then
  # Check to see if the modules init file has already been sourced
  # If not then try to source the init file for this shell.  If that
  # does not exist, source the basic "sh" file.

  if [ "x${MODULESHOME}" = "x" ]; then
    if [ -r /usr/common/nsg/opt/Modules/default/init/${THISSHELL} ]; then
      . /usr/common/nsg/opt/Modules/default/init/${THISSHELL}
    else
      if [ -r /usr/share/Modules/init/${THISSHELL} ]; then
        . /usr/share/Modules/init/${THISSHELL}
      else
        . /usr/share/Modules/init/sh
      fi
    fi
  fi

  # Now set the environment switching function
  # unload all toolchain options and load the correct one

  hpcports () {
    planck=`groups | sed -e "s#.*\(planck\).*#yes#" | sed -e "s# ##g"`
    polar=`groups | sed -e "s#.*\(polar\).*#yes#" | sed -e "s# ##g"`
    module unuse /project/projectdirs/cmb/modules/carver/hpcports_gnu/env/modulefiles
    module unuse /project/projectdirs/cmb/modules/carver/hpcports_sl6/env/modulefiles
    module unuse /project/projectdirs/cmb/modules/carver/hpcports_gnu_dx9/env/modulefiles
    if [ "$planck" = "yes" ]; then
      module unuse /project/projectdirs/planck/modules/carver/gnu/modulefiles
      module unuse /project/projectdirs/planck/modules/carver/sl6/modulefiles
      module unuse /project/projectdirs/planck/modules/carver/gnu_dx9/modulefiles
    fi
    if [ "$polar" = "yes" ]; then
      module unuse /project/projectdirs/polar/modules/carver/gnu/modulefiles
      module unuse /project/projectdirs/polar/modules/carver/sl6/modulefiles
    fi
    case $1 in
      gnu ) if [ "x$CHOS" = "xsl6carver" ]; then
              module use /project/projectdirs/cmb/modules/carver/hpcports_sl6/env/modulefiles
              if [ "$planck" = "yes" ]; then
                module use /project/projectdirs/planck/modules/carver/sl6/modulefiles
              fi
              if [ "$polar" = "yes" ]; then
                module use /project/projectdirs/polar/modules/carver/sl6/modulefiles
              fi
            else
              module use /project/projectdirs/cmb/modules/carver/hpcports_gnu/env/modulefiles
              if [ "$planck" = "yes" ]; then
                module use /project/projectdirs/planck/modules/carver/gnu/modulefiles
              fi
              if [ "$polar" = "yes" ]; then
                module use /project/projectdirs/polar/modules/carver/gnu/modulefiles
              fi
            fi;;
      dx9 ) module use /project/projectdirs/cmb/modules/carver/hpcports_gnu_dx9/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use /project/projectdirs/planck/modules/carver/gnu_dx9/modulefiles
            fi;;
        * ) echo "usage:  hpcports [ gnu | dx9 ]";;
    esac
  }
fi


if [ "x${NERSC_HOST}" = "xscigate" ]; then
  # Check to see if the modules init file has already been sourced
  # If not then try to source the init file for this shell.  If that
  # does not exist, source the basic "sh" file.

  if [ "x${MODULESHOME}" = "x" ]; then
    if [ -r /usr/share/Modules/init/${THISSHELL} ]; then
      . /usr/share/Modules/init/${THISSHELL}
    else
        . /usr/share/Modules/init/sh
    fi
  fi

  # Now set the environment switching function
  # unload all toolchain options and load the correct one

  hpcports () {
    module use /project/projectdirs/cmb/modules/sgn/hpcports/env/modulefiles
  }
fi


# This contains module files which apply to multiple systems
module use /project/projectdirs/cmb/modules/modulefiles


# This is for environment propagation using
# Cray CCM
if [ "x${PBS_JOBID}" != "x" ]; then
  if [ -e $HOME/.hpcpenv_${PBS_JOBID} ]; then
    source $HOME/.hpcpenv_${PBS_JOBID}
  fi
fi

