# Use the official PHP image as the base image
FROM php:7.4-apache

# Install PHP extensions
RUN apt-get update && \
    apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zlib1g-dev libzip-dev libicu-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql zip intl

# Copy the PHP application code to the container's web server directory
COPY / /var/www/html/
# Copy Apache configuration file from host to container
COPY /apacheconfig/your_apache_config.conf /etc/apache2/sites-available/000-default-ssl.conf
COPY /apacheconfig/your_apache_config_ssl.conf /etc/apache2/sites-available/000-default-ssl.conf


# Expose the container's port 80 to the host
EXPOSE 80
