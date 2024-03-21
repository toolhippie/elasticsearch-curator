FROM ghcr.io/dockhippie/alpine:3.19
ENTRYPOINT [""]

# renovate: datasource=pypi depName=elasticsearch-curator
ENV ELASTICSEARCH_CURATOR_VERSION=8.0.12

RUN apk update && \
  apk upgrade && \
  apk add groff python3 python3-dev py3-pip && \
  pip3 install --break-system-packages -U elasticsearch-curator==${ELASTICSEARCH_CURATOR_VERSION} && \
  rm -rf /var/cache/apk/* /root/.cache
