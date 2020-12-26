FROM alpine:3 as builder

ARG LASTPASS_CLI_VERSION=master

RUN set -x \
 && apk add --no-cache \
    bash \
    ca-certificates \
    clang \
    cmake \
    curl-dev \
    g++ \
    gcc \
    git \
    libcurl \
    libxml2-dev \
    make \
    openssl-dev \
    pkgconf \
 ;

WORKDIR /src

RUN set -x \
 && git clone --depth 1 --branch "${LASTPASS_CLI_VERSION}" https://github.com/lastpass/lastpass-cli /src/lastpass-cli \
 && cd /src/lastpass-cli \
 && make test \
 && make install \
 ;


FROM scratch

ARG build_date="2020-12-16 15:15:12+09:00"
ARG name="yujiorama/lastpass-cli"
ARG description="run lastpass-cli"
ARG usage="https://bitbucket.org/yujiorama/lastpass-cli/src/main/README.md"
ARG url="https://bitbucket.org/yujiorama/lastpass-cli.git"
ARG vcs_url="git@bitbucket.org:yujiorama/lastpass-cli.git"
ARG vcs_ref="8a31d9f"
ARG version="v0.0.1"

LABEL org.label-schema.build-date="${build_date}"
LABEL org.label-schema.name="${name}"
LABEL org.label-schema.description="${description}"
LABEL org.label-schema.usage="${usage}"
LABEL org.label-schema.url="${url}"
LABEL org.label-schema.vcs-url="${vcs_url}"
LABEL org.label-schema.vcs-ref="${vcs_ref}"
LABEL org.label-schema.version="${version}"

COPY docker-entrypoint.sh /docker-entrypoint.sh

COPY --from=builder /bin/sh /bin/rm \
                    /bin/

COPY --from=builder /usr/bin/lpass \
                    /usr/bin/

COPY --from=builder /lib/ld-musl-x86_64* /lib/libc-musl-x86_64* /lib/libcrypto.so* /lib/libssl.so* /lib/libz.so* \
                    /lib/

COPY --from=builder /usr/lib/libcurl.so* /usr/lib/liblzma.so* /usr/lib/libnghttp2.so* /usr/lib/libxml2.so* \
                    /usr/lib/

COPY --from=builder /etc/ssl/ \
                    /etc/ssl/

COPY --from=builder /etc/ca-certificates/ \
                    /etc/ca-certificates/

COPY --from=builder /etc/ca-certificates.conf \
                    /etc/

ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]
CMD ["-h"]
