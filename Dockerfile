FROM bitnami/redis:8.0.2-debian-12-r3

COPY bitnami/redis/rejson/rejson.so /opt/bitnami/redis/modules/rejson.so

RUN chmod 777 /opt/bitnami/redis/modules/rejson.so