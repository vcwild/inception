

FROM alpine:3.17

LABEL maintainer="Victor Wildner <vwildner@redhat.com>"

WORKDIR /var/www/wordpress

RUN apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/snippets \
    && mkdir -p /etc/ssl/private \
    && openssl req -x509 -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -subj "/CN=*.vwildner.42.fr/C=BR/L=Sao Paulo" \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt

COPY conf/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
