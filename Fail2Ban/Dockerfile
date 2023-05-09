ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM crazymax/fail2ban:${CONTAINER_VERSION}

#Metric
COPY --from=telegraf:1.24.4-alpine /usr/bin/telegraf /usr/bin/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
RUN sed -i '/bin\/bash/a if [ $(pidof telegraf | wc -w) -eq 0 ]; then (nohup telegraf --quiet &) fi' /usr/src/app/start.sh

