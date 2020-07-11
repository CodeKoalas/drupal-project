FROM drupal:8.8

# Set the Drush version.
ENV DRUSH_VERSION 8.1.18

# Install Drush 8 with the phar file.
RUN curl -fsSL -o /usr/local/bin/drush "https://github.com/drush-ops/drush/releases/download/$DRUSH_VERSION/drush.phar" && \
  chmod +x /usr/local/bin/drush

RUN apt-get update && apt-get install -y libxml2-dev imagemagick mysql-client ssmtp --no-install-recommends

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

ADD https://drupalconsole.com/installer /usr/local/bin/drupal
RUN chmod +x /usr/local/bin/drupal

RUN { \
    echo 'memory_limit = 196M'; \
    echo 'display_errors = Off'; \
    echo 'post_max_size = 512M'; \
    echo 'file_uploads = On'; \
    echo 'upload_max_filesize = 512M'; \
    echo 'max_file_uploads = 20'; \
} > /usr/local/etc/php/conf.d/codekoalas-settings.ini

RUN echo 'sendmail_path = "/usr/sbin/ssmtp -t -i"' > /usr/local/etc/php/conf.d/mail.ini

RUN sed -i 's/\/var\/www\/html/\/var\/www\/html\/docroot/g' /etc/apache2/sites-available/000-default.conf

RUN rm -rf /var/www/html/*

COPY ./ /var/www/html

RUN chmod -R 755 /var/www/html/docroot/sites/default

RUN chmod a+x ./run.sh

ENTRYPOINT ["/bin/sh", "-c"]

CMD ["./run.sh"]
