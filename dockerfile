FROM mysql:8.0

ENV MYSQL_ROOT_PASSWORD=bd1374

COPY ./create_tables.sql /docker-entrypoint-initdb.d/
