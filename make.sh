#!/bin/sh -ex

rm -rfv out
mkdir -p out

VERSION=$(head -n 1 version.txt)
VERSION_ALPINE=$(head -n 1 version_alpine.txt)
VERSION_MEDIAMTX=$(head -n 1 version_mediamtx.txt)

rm -f mediamtx.tar.gz
wget -O mediamtx.tar.gz "https://github.com/bluenviron/mediamtx/releases/download/v${VERSION_MEDIAMTX}/mediamtx_v${VERSION_MEDIAMTX}_linux_amd64.tar.gz"

rm -rfv tmp
mkdir tmp
tar -x -v -C tmp -f mediamtx.tar.gz

exec podman build \
--format docker \
--build-arg "version=${VERSION}" \
--build-arg "version_alpine=${VERSION_ALPINE}" \
--iidfile out/image-id.txt \
-t "io7m/mediamtx-oci:${VERSION}" .
