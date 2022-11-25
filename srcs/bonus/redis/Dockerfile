FROM debian:buster

LABEL maintainer="Victor Wildner <vwildner@redhat.com>"

RUN apt update \
    && apt install -y redis

RUN echo "\nbind 0.0.0.0\nport 6379\n" > /etc/redis/redis.conf

RUN echo "protected-mode no\n" >> /etc/redis/redis.conf

RUN mkdir /data && chown redis:redis /data

EXPOSE 6379

ENTRYPOINT ["redis-server", "/etc/redis/redis.conf"]
