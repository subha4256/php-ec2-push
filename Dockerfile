# Use the official PHP image as the base image
FROM php:7.4-apache

# Copy the PHP application code to the container's web server directory
COPY ./ /var/www/html/

# Expose the container's port 80 to the host
EXPOSE 80
