FROM php:7.2-cli-alpine

RUN apk add --update \
		autoconf \
		g++ \
		libtool \
		make \

	&& docker-php-ext-install mbstring \

	&& apk add --update icu-dev \
	&& docker-php-ext-install intl \
	&& apk add --update postgresql-dev \
	&& docker-php-ext-install pgsql \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install soap \
    && docker-php-ext-install gd \
    && docker-php-ext-install soap \
    && docker-php-ext-install gmp \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip \
    && docker-php-ext-install bz2 \

    # install redis from source
    && curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$REDIS_VERSION.tar.gz \
        && tar xfz /tmp/redis.tar.gz \
        && rm -r /tmp/redis.tar.gz \
        && mkdir -p /usr/src/php/ext \
        && mv phpredis-* /usr/src/php/ext/redis \
    && docker-php-ext-install redis \

	&& apk del \
		postgresql-libs \
		db \

	&& apk del \
		autoconf \
		bash \
		binutils \
		binutils-libs \
		db \
		expat \
		file \
		g++ \
		gcc \
		gdbm \
		gmp \
		isl \
		libatomic \
		libbz2 \
		libc-dev \
		libffi \
		libgcc \
		libgomp \
		libldap \
		libltdl \
		libmagic \
		libstdc++ \
		libtool \
		m4 \
		make \
		mpc1 \
		mpfr3 \
		musl-dev \
		perl \
		pkgconf \
		pkgconfig \
		python \
		re2c \
		readline \
		sqlite-libs \
		zlib-dev \
	&& rm -rf /tmp/* /var/cache/apk/*