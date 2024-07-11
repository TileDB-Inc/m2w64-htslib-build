set -eux

PATCH_DIR="$1"

LIBHTS_SOVERSION=${LIBHTS_SOVERSION-3}

./configure
mv config.mk config.mk.libcurl
./configure --disable-libcurl
cat config.mk
cat config.mk.libcurl

# apply patches
patch Makefile "${PATCH_DIR}/makefile.staticlink.patch"
patch config.mk "${PATCH_DIR}/config.mk.staticlink.patch"
patch htslib/hts_defs.h "${PATCH_DIR}/htslib/hts_defs.h.staticlink.patch"

make

ls -lh hts-${LIBHTS_SOVERSION}.*
