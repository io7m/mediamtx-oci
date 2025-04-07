ARG version
ARG version_alpine

FROM docker.io/library/alpine:$version_alpine

ENV PATH="/sbin:/bin:/usr/sbin:/usr/bin"

LABEL "org.opencontainers.image.authors"="Mark Raynsford"
LABEL "org.opencontainers.image.description"="A mediamtx image."
LABEL "org.opencontainers.image.licenses"="ISC"
LABEL "org.opencontainers.image.source"="https://www.github.com/io7m/mediamtx-oci"
LABEL "org.opencontainers.image.title"="MediaMTX"
LABEL "org.opencontainers.image.url"="https://www.github.com/io7m/mediamtx-oci"
LABEL "org.opencontainers.image.version"="$version"

RUN apk update

COPY tmp/mediamtx mediamtx

ENTRYPOINT ["/mediamtx"]
