FROM bitnami/redis:8.0.2-debian-12-r3

USER 0
RUN apt-get update && apt-get install -y \
    libxcrypt-source \
    build-essential \
    autoconf \
    automake \
    libtool \
    pkg-config \
    xz-utils \
    wget \
    && cd /usr/src \
    && tar -xf libxcrypt.tar.xz \
    && cd libxcrypt-* \
    && ./autogen.sh \
    && ./configure --enable-hashes=strong,glibc --enable-obsolete-api=yes --enable-crypt-compat \
    && make -j"$(nproc)" \
    && cp src/.libs/libcrypt.so.2 /usr/lib/x86_64-linux-gnu/ \
    && cd / \
    && rm -rf /usr/src/libxcrypt* \
    && apt-get purge -y \
        build-essential \
        autoconf \
        automake \
        libtool \
        pkg-config \
        libxcrypt-source \
    && apt-get autoremove -y \
    && apt-get clean


RUN mkdir -p /opt/bitnami/redis/modules
COPY bitnami/redis/rejson/rejson.so /opt/bitnami/redis/modules/rejson.so
COPY bitnami/redis/redisearch/module-enterprise.so /opt/bitnami/redis/modules/redisearch.so

RUN chmod 777 -R /opt/bitnami/redis/modules
USER 1001