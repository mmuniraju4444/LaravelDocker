ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM docker.elastic.co/elasticsearch/elasticsearch:${CONTAINER_VERSION}
# To Disable Authenticate
RUN elasticsearch-plugin remove x-pack
