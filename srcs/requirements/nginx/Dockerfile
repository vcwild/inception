

FROM alpine:3.15

LABEL maintainer="Victor Wildner <vwildner@redhat.com>"

WORKDIR /var/www

RUN apk add nginx openssl --no-cache; \
    mkdir wordpress; \
    touch wordpress/index.html; \
    echo hello, world > wordpress/index.html;

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
