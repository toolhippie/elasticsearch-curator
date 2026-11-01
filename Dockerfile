FROM ghcr.io/dockhippie/alpine:3.23@sha256:1194c744e2b2a03ecb3214aecb89005830fa422b4a8f84cd12951d6d29df7a4c
ENTRYPOINT [""]

# renovate: datasource=pypi depName=elasticsearch-curator
ENV ELASTICSEARCH_CURATOR_VERSION=9.0.0

RUN apk update && \
  apk upgrade && \
  apk add groff python3 python3-dev py3-pip rust cargo build-base openssl-dev libffi-dev && \
  pip3 install --break-system-packages -U elasticsearch-curator==${ELASTICSEARCH_CURATOR_VERSION} && \
  apk del rust cargo build-base openssl-dev libffi-dev && \
  rm -rf /var/cache/apk/* /root/.cache
