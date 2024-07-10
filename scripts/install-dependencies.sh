# https://github.com/samtools/htslib/blob/463830bf7de8c4ab731c4d67c49ddc446f498f50/INSTALL#L276
# https://github.com/samtools/htslib/blob/develop/.appveyor.yml

# Downgrade curl to version that can be statically linked
# https://github.com/msys2/MINGW-packages/issues/21028
# https://github.com/LizardByte/Sunshine/issues/2722#issuecomment-2177325777
wget https://repo.msys2.org/mingw/ucrt64/mingw-w64-ucrt-x86_64-curl-8.8.0-1-any.pkg.tar.zst
pacman -U --noconfirm mingw-w64-ucrt-x86_64-curl-8.8.0-1-any.pkg.tar.zst

pacman -S --noconfirm --needed \
  --ignore=mingw-w64-ucrt-x86_64-curl \
  base-devel \
  mingw-w64-x86_64-toolchain \
  mingw-w64-x86_64-autotools \
  mingw-w64-x86_64-zlib \
  mingw-w64-x86_64-bzip2 \
  mingw-w64-x86_64-xz \
  mingw-w64-x86_64-curl \
  mingw-w64-x86_64-tools-git \
  mingw-w64-x86_64-libdeflate

pacman -Q
pacman -Ss curl
