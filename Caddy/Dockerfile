ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM caddy:${CONTAINER_VERSION}-alpine
# Install Curl
RUN apk --no-cache add curl
# Copy setup data to Container
COPY setup/Caddyfile /etc/caddy/
COPY setup/site/* /srv