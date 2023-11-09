FROM	alpine:3.17
ARG	DB_NAME
ARG	MYSQL_USER
ARG	MYSQL_PASSWORD
RUN	apk update && apk upgrade && apk add --no-cache \
		php \
		php-fpm \
		php-curl \
		php-mysqli \
		php-json \
		php-dom \
		php-fileinfo \
		php-exif \
		php-openssl \
		php-mbstring \
		php-zip \
		php-xml \
		wget \
		unzip \
	&& sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
		/etc/php81/php-fpm.d/www.conf \
	&& sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
		/etc/php81/php-fpm.d/www.conf \
	&& sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
		/etc/php81/php-fpm.d/www.conf \
	&& rm -f /var/cache/apk/*
WORKDIR	/var/www
RUN	wget https://wordpress.org/latest.zip \
	&& unzip latest.zip \
	&& cp -rf wordpress/* . \
	&& rm -rf wordpress latest.zip
COPY	./requirements/wordpress/conf/wp-config-create.sh .
RUN	sh wp-config-create.sh && rm wp-config-create.sh \
		&& chmod -R 0777 wp-content/
CMD	["/usr/sbin/php-fpm81", "-F"]
