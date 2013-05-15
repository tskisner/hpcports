
# This computes the astromatic package version based on a checksum
# of the versions of the dependencies.

MD5=$1
ENV=$2

deps=`head -n 1 deps`

depstr=""

for dep in ${deps}; do
	if [ ! -e ../overrides_${TARGET}/${dep} ]; then
		# FIXME!!!  This does not handle dependencies with generated versions.
		# This means that all packages with generated versions that are not
		# equal to $(HPCP_ENV) cannot be used as dependencies.
		depver=${ENV}
		if [ -e ../${dep}/version ]; then
			depver=`head -n 1 ../${dep}/version`
		fi
		depstr="${depstr}${depver}"
	fi
done

check=`echo ${depstr} | ${MD5} | head -c 8`
echo "${check}"

exit 0
