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
    module unuse /scratch/scratchdirs/kisner/software/hpcports_shared_gnu/env/modulefiles
    module unuse /scratch/scratchdirs/kisner/software/hpcports_gnu/env/modulefiles
    if [ "$planck" = "yes" ]; then
      module unuse /scratch/scratchdirs/kisner/software/planck_shared_gnu/modulefiles
      module unuse /scratch/scratchdirs/kisner/software/planck_gnu/modulefiles
    fi
    if [ "$polar" = "yes" ]; then
      module unuse /scratch/scratchdirs/kisner/software/pbear_shared_gnu/modulefiles
    fi
    case $1 in
      gnu ) module use /scratch/scratchdirs/kisner/software/hpcports_gnu/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use /scratch/scratchdirs/kisner/software/planck_gnu/modulefiles
            fi;;
      shared_gnu ) module use /scratch/scratchdirs/kisner/software/hpcports_shared_gnu/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use /scratch/scratchdirs/kisner/software/planck_shared_gnu/modulefiles
            fi
            if [ "$polar" = "yes" ]; then
              module use /scratch/scratchdirs/kisner/software/pbear_shared_gnu/modulefiles
            fi;;
        * ) echo "usage:  hpcports [ shared_gnu | gnu ]";;
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
    module unuse /scratch1/scratchdirs/kisner/software/hpcports_gnu/env/modulefiles
    if [ "$planck" = "yes" ]; then
      module unuse /scratch1/scratchdirs/kisner/software/planck_gnu/modulefiles
    fi
    if [ "$polar" = "yes" ]; then
      module unuse /scratch1/scratchdirs/kisner/software/pbear_gnu/modulefiles
    fi
    case $1 in
      gnu|shared_gnu ) module use /scratch1/scratchdirs/kisner/software/hpcports_gnu/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use /scratch1/scratchdirs/kisner/software/planck_gnu/modulefiles
            fi
            if [ "$polar" = "yes" ]; then
              module use /scratch1/scratchdirs/kisner/software/pbear_gnu/modulefiles
            fi;;
        * ) echo "usage:  hpcports [ gnu ]";;
    esac
  }
fi


if [ "x${NERSC_HOST}" = "xcori" ]; then
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
    soft=/global/cscratch1/sd/kisner/software
    module unuse ${soft}/hpcports_gnu/env/modulefiles
    if [ "$planck" = "yes" ]; then
      module unuse ${soft}/planck_gnu/modulefiles
    fi
    if [ "$polar" = "yes" ]; then
      module unuse ${soft}/pbear_gnu/modulefiles
    fi
    case $1 in
      gnu ) module use ${soft}/hpcports_gnu/env/modulefiles
            if [ "$planck" = "yes" ]; then
              module use ${soft}/planck_gnu/modulefiles
            fi
            if [ "$polar" = "yes" ]; then
              module use ${soft}/pbear_gnu/modulefiles
            fi;;
        * ) echo "usage:  hpcports [ gnu | intel ]";;
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


