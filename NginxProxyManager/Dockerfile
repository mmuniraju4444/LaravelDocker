ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM jc21/nginx-proxy-manager:${CONTAINER_VERSION}

# Copy .htpasswd Files
COPY .htpasswd /etc/nginx/

#Metric
#COPY --from=telegraf:1.26.2-alpine /usr/bin/telegraf /usr/bin/telegraf
#COPY telegraf.conf /etc/telegraf/telegraf.conf
#RUN sed -i '/bin\/execlineb/a if { pipeline {pidof telegraf} wc -w -eq 0 }  nohup telegraf --quiet &'  /init
