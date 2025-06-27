FROM bitnami/redis:8.0.2-debian-12-r3

RUN mkdir -p /opt/bitnami/redis/modules
COPY bitnami/redis/rejson/rejson.so /opt/bitnami/redis/modules/rejson.so
COPY bitnami/redis/redisearch/module-enterprise.so /opt/bitnami/redis/modules/module-enterprise.so

USER 0
RUN chmod 777 -R /opt/bitnami/redis/modules
USER 1001