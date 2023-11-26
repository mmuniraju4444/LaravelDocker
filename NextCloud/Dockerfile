ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM nextcloud:${CONTAINER_VERSION}-apache
RUN chown -R www-data:root /var/www;

#Metrics
COPY ./telegraf.conf /etc/telegraf/telegraf.conf
COPY --from=telegraf:1.26.2-alpine /usr/bin/telegraf /usr/bin/telegraf
RUN sed -i '/bin\/sh/a if [ $(pidof telegraf | wc -w) -eq 0 ]; then (nohup telegraf --quiet &) fi' /entrypoint.sh