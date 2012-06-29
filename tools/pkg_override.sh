
# This generates a fake module file for packages with local overrides

PKG=$1
ENV=$2
PREFIX=$3
VER=$4
CPP=$5
LD=$6
DATA=$7
LIB_CC=$8
LIB_CXX=$9
LIB_F77=$10
LIB_FC=$11
LIB_MPICC=$12
LIB_MPICXX=$13
LIB_MPIF77=$14
LIB_MPIFC=$15

# File headers

echo '#%Module###<-magic cookie ####################################################
##' > ${PKG}.module
echo "##   ${PKG} " >> ${PKG}.module
echo '##   HPCPorts module file
##
##
# variables for Tcl script use only' >> ${PKG}.module
echo "set     version  ${VER}" >> ${PKG}.module
echo "" >> ${PKG}.module
echo "module-whatis \"Loads the HPCPorts (overridden) version of ${PKG}\"" >> ${PKG}.module
echo "" >> ${PKG}.module

# Package vars:

echo "setenv ${PKG}_VERSION \"${VER}\"" >> ${PKG}.module

echo "" >> ${PKG}.module

# module file boiler-plate

echo "proc ModulesHelp { } {" >> ${PKG}.module
echo "  global version" >> ${PKG}.module
echo "  puts stderr \"\\\t    ${PKG} - Version \$version\\\n\"" >> ${PKG}.module
echo "  puts stderr \"\\\t This module file was auto-generated for the ${PKG}\"" >> ${PKG}.module
echo "  puts stderr \"\\\t package as part of the HPCPorts installation system.\"" >> ${PKG}.module
echo "  puts stderr \"\\\t In general, this module may modify the PATH,\"" >> ${PKG}.module
echo "  puts stderr \"\\\t LD_LIBRARY_PATH, and MANPATH environment variables,\"" >> ${PKG}.module
echo "  puts stderr \"\\\t as well as setting any variables needed for compiling\"" >> ${PKG}.module
echo "  puts stderr \"\\\t and linking against libraries in this package.\"" >> ${PKG}.module
echo "  puts stderr \"\"" >> ${PKG}.module
echo "}" >> ${PKG}.module
echo "" >> ${PKG}.module
echo "conflict ${PKG}" >> ${PKG}.module
echo "" >> ${PKG}.module

echo "setenv ${PKG}_PREFIX \"${PREFIX}\"" >> ${PKG}.module
echo "setenv ${PKG}_CPPFLAGS \"${CPP}\"" >> ${PKG}.module
echo "setenv ${PKG}_LDFLAGS \"${LD}\"" >> ${PKG}.module
echo "setenv ${PKG}_DATA \"${DATA}\"" >> ${PKG}.module
echo "setenv ${PKG}_LIBS_CC \"${LIB_CC}\"" >> ${PKG}.module
echo "setenv ${PKG}_LIBS_CXX \"${LIB_CXX}\"" >> ${PKG}.module
echo "setenv ${PKG}_LIBS_F77 \"${LIB_F77}\"" >> ${PKG}.module
echo "setenv ${PKG}_LIBS_FC \"${LIB_FC}\"" >> ${PKG}.module
echo "setenv ${PKG}_LIBS_MPICC \"${LIB_MPICC}\"" >> ${PKG}.module
echo "setenv ${PKG}_LIBS_MPICXX \"${LIB_MPICXX}\"" >> ${PKG}.module
echo "setenv ${PKG}_LIBS_MPIF77 \"${LIB_MPIF77}\"" >> ${PKG}.module
echo "setenv ${PKG}_LIBS_MPIFC \"${LIB_MPIFC}\"" >> ${PKG}.module

# Handle dependencies.  Since this is an external piece of software,
# we have no idea what versions of dependencies are required.  Presumably
# the user is either overriding dependencies as well, or they are loading
# the correct version through some other mechanism.

deps=`head -n 1 ../${PKG}/deps`

for dep in ${deps}; do
	echo "if [ module-info mode load ] {" >> ${PKG}.module
	echo "	if [ is-loaded ${dep} ] {" >> ${PKG}.module
	echo "	} else {" >> ${PKG}.module
	echo "	  module load ${dep}" >> ${PKG}.module
	echo "	}" >> ${PKG}.module
	echo "}" >> ${PKG}.module
	echo "" >> ${PKG}.module
done

echo "" >> ${PKG}.module

# module file version

echo '#%Module###################################################################
####' > ${PKG}.version
echo "## version file for ${PKG}" >> ${PKG}.version
echo '##' >> ${PKG}.version
echo "set ModulesVersion      \"${VER}-${ENV}\"" >> ${PKG}.version


