FROM ghcr.io/dockhippie/alpine:3.23@sha256:1cb712df5842561657169b93b1845cffa82de67560125cf22d49639566e32c1e
ENTRYPOINT [""]

# renovate: datasource=pypi depName=elasticsearch-curator
ENV ELASTICSEARCH_CURATOR_VERSION=9.0.0

RUN apk update && \
  apk upgrade && \
  apk add groff python3 python3-dev py3-pip rust cargo build-base openssl-dev libffi-dev && \
  pip3 install --break-system-packages -U elasticsearch-curator==${ELASTICSEARCH_CURATOR_VERSION} && \
  apk del rust cargo build-base openssl-dev libffi-dev && \
  rm -rf /var/cache/apk/* /root/.cache
