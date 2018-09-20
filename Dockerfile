FROM brainbeanapps/base-linux-build-environment:latest

LABEL maintainer="devops@brainbeanapps.com"

ARG PHP_VERSION=7.2

# Switch to root
USER root

# Copy assets
WORKDIR /opt

# Install PHP & various dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    php-pear \
    php${PHP_VERSION} php${PHP_VERSION}-mysqli php${PHP_VERSION}-curl php${PHP_VERSION}-gd php${PHP_VERSION}-xml \
    php${PHP_VERSION}-intl php${PHP_VERSION}-bcmath php${PHP_VERSION}-json php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-pgsql php${PHP_VERSION}-imagick php${PHP_VERSION}-memcache php${PHP_VERSION}-memcached \
    php${PHP_VERSION}-gettext php${PHP_VERSION}-opcache php${PHP_VERSION}-cli php${PHP_VERSION}-zip \
    php${PHP_VERSION}-redis \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Switch to user
USER user
WORKDIR /home/user
