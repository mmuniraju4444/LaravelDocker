ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM mongo:${CONTAINER_VERSION}
CMD ["mongod --smallfiles --replSet rs0 --oplogSize 128"]