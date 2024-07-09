# m2w64-htslib-build

The workflow [msys2-htslib-build.yml][] builds a statically linked[^explanation] htslib.dll
under msys2. See the [releases][] to download the tarball. To build a different
version of [htslib][], update the env var `PACKAGE_VERSION`. To build an updated
release of an existing version, update the env var `RELEASE_VERSION`. Also, make
sure that `RELEASE_VERSION` is reset to 0 when bumping the version.

[msys2-htslib-build.yml]: https://github.com/TileDB-Inc/m2w64-htslib-build/blob/main/.github/workflows/msys2-htslib-build.yml
[releases]: https://github.com/TileDB-Inc/m2w64-htslib-build/releases
[htslib]: https://github.com/samtools/htslib

The release tarball is subsequently consumed by
[TileDB-Inc/m2w64-htslib-feedstock][], which repackages the pre-built files into
a conda binary. The end goal is for [TileDB-Inc/tiledb-vcf-feedstock][] to
create a conda binary for Windows that builds [TileDB-Inc/TileDB-VCF][] with
MSVC and links to the htslib that was built under msys2 (since the upstream
maintainers of htslib only officially supporting building htslib for Windows
under msys2).

[TileDB-Inc/m2w64-htslib-feedstock]: https://github.com/TileDB-Inc/m2w64-htslib-feedstock
[TileDB-Inc/tiledb-vcf-feedstock]: https://github.com/TileDB-Inc/tiledb-vcf-feedstock
[TileDB-Inc/TileDB-VCF]: https://github.com/TileDB-Inc/TileDB-VCF

[^explanation]: 'statically linked' here implies static linkage to all needed
msys2 libraries that are not referencing .DLLs that are provided by Windows
