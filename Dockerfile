FROM debian:wheezy

LABEL maintainer="kristeryw@gmail.com"

# Install
RUN apt-get update && \
	DEBIAN_FRONTEND='noninteractive' apt-get install -y \
		php5-cli \
		php5-xdebug \
		php5-gd \
		php5-mcrypt \
		php5-mysql \
		php5-pgsql \
		php5-sqlite \
		php5-curl \
		php5-json \
		php5-intl \
	&& \
	sed -i 's/memory_limit\s*=.*/memory_limit=-1/g' /etc/php5/cli/php.ini && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
COPY docker-php-entrypoint /usr/local/bin/
  
ENTRYPOINT ["docker-php-entrypoint"]

CMD ["php", "-a"]
