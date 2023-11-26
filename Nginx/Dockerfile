ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM nginx:${CONTAINER_VERSION}-alpine
# Install Curl
RUN apk --no-cache add curl libmaxminddb-dev nginx-mod-http-geoip tar make g++ zlib-dev linux-headers pcre-dev openssl-dev

# remove default config
RUN rm /etc/nginx/conf.d/default.conf && mkdir -p /usr/local/share/nginx/modules

# Download Module
RUN wget https://github.com/leev/ngx_http_geoip2_module/archive/3.4.tar.gz -P /usr/local/share/nginx/modules/ && \
    tar zxvf /usr/local/share/nginx/modules/3.4.tar.gz -C /usr/local/share/nginx/modules && \
    rm /usr/local/share/nginx/modules/3.4.tar.gz

# Build Module
RUN cd /usr/local/share/nginx && \
    wget http://nginx.org/download/nginx-1.20.2.tar.gz && \
    tar zxvf /usr/local/share/nginx/nginx-1.20.2.tar.gz && \
    rm /usr/local/share/nginx/nginx-1.20.2.tar.gz && \
    cd nginx-1.20.2 && \
    ./configure --with-compat --add-dynamic-module=/usr/local/share/nginx/modules/ngx_http_geoip2_module-3.4 --with-stream && \
    make && \
    make install && \
    cp objs/*.so /etc/nginx/modules

# Copy nginx.conf to Container
COPY conf/nginx.conf /etc/nginx/

# Copy app.conf to Container
COPY conf/app.conf /etc/nginx/sites-available/app.conf

# Copy SSl Files
COPY ssl/* /etc/nginx/ssl/

# Copy .htpasswd Files
COPY .htpasswd /etc/nginx/

# Copy geoip Files
COPY conf/geoip /etc/nginx/geoip

#Metric
#COPY --from=telegraf:1.26.2-alpine /usr/bin/telegraf /usr/bin/telegraf
#COPY telegraf.conf /etc/telegraf/telegraf.conf
#RUN sed -i '/bin\/sh/a if [ $(pidof telegraf | wc -w) -eq 0 ]; then (nohup telegraf --quiet &) fi'  docker-entrypoint.sh
