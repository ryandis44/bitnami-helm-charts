FROM bitnami/redis:8.0.2-debian-12-r3

USER 0
RUN apt-get update && \
    apt-get install -y wget && \
    wget http://ftp.debian.org/debian/pool/main/libx/libxcrypt/libcrypt1_4.4.38-1_riscv64.deb && \
    apt-get install -y ./libcrypt1_4.4.38-1_riscv64.deb && \
    rm libcrypt1_4.4.38-1_riscv64.deb


RUN mkdir -p /opt/bitnami/redis/modules
COPY bitnami/redis/rejson/rejson.so /opt/bitnami/redis/modules/rejson.so
COPY bitnami/redis/redisearch/module-enterprise.so /opt/bitnami/redis/modules/redisearch.so

RUN chmod 777 -R /opt/bitnami/redis/modules
USER 1001