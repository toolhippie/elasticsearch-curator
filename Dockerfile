FROM ghcr.io/dockhippie/alpine:3.22@sha256:29332ffd57d5b3922d93a7e0d47484f5da7a963fc8dfd7654ec10a48bf36a20f
ENTRYPOINT [""]

# renovate: datasource=pypi depName=elasticsearch-curator
ENV ELASTICSEARCH_CURATOR_VERSION=9.0.0

RUN apk update && \
  apk upgrade && \
  apk add groff python3 python3-dev py3-pip rust cargo build-base openssl-dev libffi-dev && \
  pip3 install --break-system-packages -U elasticsearch-curator==${ELASTICSEARCH_CURATOR_VERSION} && \
  apk del rust cargo build-base openssl-dev libffi-dev && \
  rm -rf /var/cache/apk/* /root/.cache
