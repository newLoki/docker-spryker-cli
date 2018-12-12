FROM php:7.2-cli-alpine

RUN apk add --update \
		autoconf \
		g++ \
		libtool \
		make \
		libxml2

RUN docker-php-ext-install bcmath \
    && docker-php-ext-install soap \
    && docker-php-ext-install gd \
    && docker-php-ext-install soap \
    && docker-php-ext-install gmp \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip \
    && docker-php-ext-install bz2

RUN docker-php-ext-install mbstring \

RUN apk add --update icu-dev \
	&& docker-php-ext-install intl \
	&& apk del \
	    icu-dev

RUN apk add --update postgresql-dev \
	&& docker-php-ext-install pgsql \
	&& apk del \
		postgresql-libs \
		db


    # install redis from source
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$REDIS_VERSION.tar.gz \
        && tar xfz /tmp/redis.tar.gz \
        && rm -r /tmp/redis.tar.gz \
        && mkdir -p /usr/src/php/ext \
        && mv phpredis-* /usr/src/php/ext/redis \
    && docker-php-ext-install redis



RUN apk del \
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