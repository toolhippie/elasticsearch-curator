FROM webhippie/alpine:3.17
ENTRYPOINT [""]

# renovate: datasource=pypi depName=elasticsearch-curator
ENV ELASTICSEARCH_CURATOR_VERSION=8.0.1

RUN apk update && \
  apk upgrade && \
  apk add groff python3 python3-dev py3-pip && \
  pip3 install -U elasticsearch-curator==${ELASTICSEARCH_CURATOR_VERSION} && \
  rm -rf /var/cache/apk/* /root/.cache
