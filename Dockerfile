# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
# This post might help us figure out mail: https://stackoverflow.com/questions/47247952/send-email-on-testing-docker-container-with-php-and-sendmail
FROM php:8.2-apache-bookworm
RUN a2dismod mpm_event mpm_worker || true && a2enmod mpm_prefork

RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        libcurl4-openssl-dev && \
    pecl install redis-5.3.7 && \
    docker-php-ext-enable redis && \
    docker-php-ext-install curl && \
    rm -rf /var/lib/apt/lists/*

CMD ["sh", "-c", "rm -f /etc/apache2/mods-enabled/mpm_*.load /etc/apache2/mods-enabled/mpm_*.conf && a2enmod mpm_prefork && exec apache2-foreground"]
