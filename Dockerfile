FROM ghcr.io/dockhippie/alpine:3.23@sha256:a487d822b211f6a58d975eb01a2896d8f18258e676008cb83ef80e5ad3ba2c1f
ENTRYPOINT [""]

# renovate: datasource=pypi depName=elasticsearch-curator
ENV ELASTICSEARCH_CURATOR_VERSION=9.0.0

RUN apk update && \
  apk upgrade && \
  apk add groff python3 python3-dev py3-pip rust cargo build-base openssl-dev libffi-dev && \
  pip3 install --break-system-packages -U elasticsearch-curator==${ELASTICSEARCH_CURATOR_VERSION} && \
  apk del rust cargo build-base openssl-dev libffi-dev && \
  rm -rf /var/cache/apk/* /root/.cache
