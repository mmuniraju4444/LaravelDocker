ARG CONTAINER_VERSION=${CONTAINER_VERSION}
FROM mysql:${CONTAINER_VERSION}

COPY ./Conf /etc/mysql/mysql.conf.d
# mysql --user=root --password=root --default_character_set utf8 < database_name < database