set -eu

PATCH_DIR="$1"

LIBHTS_SOVERSION=${LIBHTS_SOVERSION-3}

./configure --disable-libcurl

# apply patches
patch config.mk "${PATCH_DIR}/config.mk.staticlink.patch"
patch htslib/hts_defs.h "${PATCH_DIR}/htslib/hts_defs.h.staticlink.patch"

make

ls -lh hts-${LIBHTS_SOVERSION}.*
