FROM tnnfinance/php:7.2-dev

COPY php.ini /usr/local/etc/php/php.ini

RUN apt-get update && apt-get install -y curl git python python-pip jq libssl-dev curl ruby rubygems curl puppet apt-transport-https ruby-dev sudo  unzip wget  rsync software-properties-common libjpeg62-turbo-dev ssh apt-transport-https ca-certificates curl gnupg-agent software-properties-common

RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh;  bash  nodesource_setup.sh
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"
RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -
RUN apt-get update && apt-get install -y nodejs npm docker-ce docker-compose

RUN apt-get install -y python-setuptools
RUN pip install --upgrade pip
RUN pip install fabric s3cmd awscli boto boto3 PyHamcrest requests pip

RUN apt-get install -y libxml2-dev
RUN docker-php-ext-install soap

RUN wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip && unzip -d /usr/bin/ terraform_0.11.14_linux_amd64.zip

