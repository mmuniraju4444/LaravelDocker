ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM nginx:${CONTAINER_VERSION}-alpine
# Install Curl
RUN apk --no-cache add curl
# Copy nginx.conf to Container
COPY conf/nginx.conf /etc/nginx/
COPY conf/app.conf /etc/nginx/sites-available/app.conf

# Copy SSl Files
COPY ssl/* /etc/nginx/ssl/
COPY .htpasswd /etc/nginx/
# remove default config
RUN rm /etc/nginx/conf.d/default.conf