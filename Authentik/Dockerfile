ARG CONTAINER_VERSION=4
FROM ghcr.io/goauthentik/server:${CONTAINER_VERSION}

#Metric
#COPY --from=telegraf:1.26.2-alpine /usr/bin/telegraf /usr/bin/telegraf
#COPY telegraf.conf /etc/telegraf/telegraf.conf
#RUN sed -i '/bin\/sh/a if [ $(pidof telegraf | wc -w) -eq 0 ]; then (nohup telegraf --quiet &) fi'  /usr/local/bin/docker-entrypoint.sh