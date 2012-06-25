
# This generates a fake module file for packages with local overrides

PKG=$1
VER=$2


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
echo "set ModulesVersion      \"${VER}-hpcp\"" >> ${PKG}.version


