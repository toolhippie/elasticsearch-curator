FROM ghcr.io/dockhippie/alpine:3.23@sha256:ab739d6c611c2153c817d6b8f56a4359be087703d563d539e08a475f2fcb72d3
ENTRYPOINT [""]

# renovate: datasource=pypi depName=elasticsearch-curator
ENV ELASTICSEARCH_CURATOR_VERSION=9.0.0

RUN apk update && \
  apk upgrade && \
  apk add groff python3 python3-dev py3-pip rust cargo build-base openssl-dev libffi-dev && \
  pip3 install --break-system-packages -U elasticsearch-curator==${ELASTICSEARCH_CURATOR_VERSION} && \
  apk del rust cargo build-base openssl-dev libffi-dev && \
  rm -rf /var/cache/apk/* /root/.cache
