ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM mariadb:${CONTAINER_VERSION}
# Copy all the Conf files
COPY ./Conf /etc/mysql/mariadb.conf.d

#Metrics
#COPY ./telegraf.conf /etc/telegraf/telegraf.conf
#COPY --from=telegraf:1.26.2 /usr/bin/telegraf /usr/bin/telegraf
#RUN sed -i '/bin\/bash/a if [ $(pidof telegraf | wc -w) -eq 0 ]; then (nohup telegraf --quiet &) fi' /usr/local/bin/docker-entrypoint.sh