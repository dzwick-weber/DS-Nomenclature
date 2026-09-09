# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
FROM php:8.2-apache-bookworm

# Install required PHP extensions and dependencies
RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        libcurl4-openssl-dev && \
    pecl install redis-5.3.7 && \
    docker-php-ext-enable redis && \
    docker-php-ext-install curl && \
    rm -rf /var/lib/apt/lists/*

# Enable Apache URL rewrite module and allow .htaccess overrides
RUN a2enmod rewrite
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Point Apache DocumentRoot to the application/nomenclature subdirectory
RUN sed -i 's!/var/www/html!/var/www/html/application/nomenclature!g' /etc/apache2/sites-available/000-default.conf

# Copy project files and grant Apache permissions
COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html

CMD ["sh", "-c", "rm -f /etc/apache2/mods-enabled/mpm_*.load /etc/apache2/mods-enabled/mpm_*.conf && a2enmod mpm_prefork && exec apache2-foreground"]
