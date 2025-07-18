FROM bitnami/redis:8.0.3-debian-12-r1

RUN mkdir -p /opt/bitnami/redis/modules
COPY bitnami/redis/rejson/rejson.so /opt/bitnami/redis/modules/rejson.so

USER 0
RUN chmod 777 -R /opt/bitnami/redis/modules
USER 1001