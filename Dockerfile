FROM webhippie/python:3.7

ENTRYPOINT ["/usr/bin/curator"]

# renovate: datasource=pypi depName=elasticsearch-curator
ENV ELASTICSEARCH_CURATOR_VERSION=5.8.4

RUN apk update && \
  apk upgrade && \
  pip3 install -U elasticsearch-curator==${ELASTICSEARCH_CURATOR_VERSION} && \
  rm -rf /var/cache/apk/*
