FROM php:8.1.0-apache

# Install necessary extensions
RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy the custom vhost file
COPY ./laravel-vhost.conf /etc/apache2/sites-available/000-default.conf

# Copy application code
COPY ./src /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html