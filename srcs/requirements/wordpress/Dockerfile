FROM alpine:3.15

WORKDIR /var/www

LABEL maintainer="Victor Wildner <vwildner@redhat.com>"

RUN apk add --no-cache php7-fpm php7-common php7-session php7-iconv php7-json php7-gd \
    php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi \
    php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
    php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml \
    && rm /etc/php7/php-fpm.d/www.conf;

RUN wget https://wordpress.org/wordpress-6.0.3.tar.gz \
    && tar xzf wordpress-6.0.3.tar.gz

COPY conf/wordpress.conf /etc/php7/php-fpm.d/www.conf

COPY conf/wp-config.php /var/www/wordpress/wp-config.php

RUN chown nobody:nobody /var/www/wordpress/wp-config.php

VOLUME /var/www/wordpress

EXPOSE 9000

CMD [ "php-fpm7", "-F" ]
