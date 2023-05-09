ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM redis:${CONTAINER_VERSION}-alpine

#Metric
COPY --from=telegraf:1.24.4-alpine /usr/bin/telegraf /usr/bin/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
RUN sed -i '/bin\/sh/a if [ $(pidof telegraf | wc -w) -eq 0 ]; then (nohup telegraf --quiet &) fi'  /usr/local/bin/docker-entrypoint.sh