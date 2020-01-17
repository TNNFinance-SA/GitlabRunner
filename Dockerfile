FROM php:7.2-fpm

RUN apt-get update && buildDeps="libpq-dev libzip-dev" && apt-get install -y $buildDeps git nano wget vim libpcre3-dev libmcrypt-dev libmemcached-dev libmemcached11 libmemcachedutil2 --no-install-recommends curl git python python-pip jq libssl-dev curl ruby rubygems curl puppet apt-transport-https ruby-dev sudo  unzip wget  rsync software-properties-common libjpeg62-turbo-dev ssh
RUN docker-php-ext-install pdo pdo_pgsql pgsql zip bcmath mbstring
RUN pecl install xdebug && docker-php-ext-enable xdebug
RUN pecl install memcached && docker-php-ext-enable memcached

RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

RUN wget https://getcomposer.org/composer.phar && mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"
RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -
RUN apt-get update && apt-get install -y nodejs docker-ce
COPY php.ini /usr/local/etc/php/php.ini

RUN apt-get install -y python-setuptools
RUN pip install --upgrade pip
RUN pip install fabric s3cmd awscli boto boto3 PyHamcrest requests pip

RUN apt-get install -y libxml2-dev
RUN docker-php-ext-install soap

RUN wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip && unzip -d /usr/bin/ terraform_0.11.14_linux_amd64.zip

