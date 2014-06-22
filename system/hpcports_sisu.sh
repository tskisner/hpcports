# This is a bourne shell compatible resource file that is designed to initialize
# the HPCPorts modules environment.  You should source this file in your
# bourne compatible shell resource file, at the very beginning of that file.

# What shell are we using?
THISSHELL=`echo $SHELL | sed -e 's/.*\/\(.*\)$/\1/'`

# Check to see if the modules init file has already been sourced
# If not then try to source the init file for this shell.  If that
# does not exist, source the basic "sh" file.

if [ "x${MODULESHOME}" = "x" ]; then
  if [ -r /opt/modules/3.2.6.6/init/${THISSHELL} ]; then
    . /opt/modules/3.2.6.6/init/${THISSHELL}
  else
    . /opt/modules/3.2.6.6/init/sh
  fi
fi

# Now set the environment switching function
# unload all toolchain options and load the correct one

hpcports () {
  module unuse /proj/planck/software/hpcports_gnu/env/modulefiles
  module unuse /proj/planck/software/hpcports_shared_gnu/env/modulefiles
  module unuse /proj/planck/software/planck_shared_gnu/modulefiles
  module unuse /proj/planck/software/planck_gnu/modulefiles
  case $1 in
    shared_gnu ) module use /proj/planck/software/hpcports_shared_gnu/env/modulefiles
      module use /proj/planck/software/planck_shared_gnu/modulefiles
      ;;
    login ) module use /proj/planck/software/hpcports_shared_gnu/env/modulefiles
      module use /proj/planck/software/planck_shared_gnu/modulefiles
      ;;
    gnu ) module use /proj/planck/software/hpcports_gnu/env/modulefiles
      module use /proj/planck/software/planck_gnu/modulefiles
      ;;
    * ) echo "usage:  hpcports [ gnu | shared_gnu ]"
      ;;
  esac
}

