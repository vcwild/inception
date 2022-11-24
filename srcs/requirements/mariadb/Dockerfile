FROM alpine:3.17

LABEL maintainer="Victor Wildner <vwildner@redhat.com>"

RUN apk update \
    && apk upgrade \
    && apk add --no-cache mariadb mariadb-client

COPY tools/config.sh /tmp/config.sh

RUN chmod u+x /tmp/config.sh

EXPOSE 3306

VOLUME /var/lib/mysql

ENTRYPOINT [ "sh", "/tmp/config.sh" ]
