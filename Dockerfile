FROM bitnami/redis:8.0.2-debian-12-r3

USER 0
RUN apt-get update && apt-get install -y libxcrypt-source


RUN mkdir -p /opt/bitnami/redis/modules
COPY bitnami/redis/rejson/rejson.so /opt/bitnami/redis/modules/rejson.so
COPY bitnami/redis/redisearch/module-enterprise.so /opt/bitnami/redis/modules/redisearch.so

RUN chmod 777 -R /opt/bitnami/redis/modules
USER 1001