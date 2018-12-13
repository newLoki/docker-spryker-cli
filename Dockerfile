FROM php:7.2-cli-alpine

RUN apk add --update \
		autoconf \
		g++ \
		libtool \
		make

RUN docker-php-ext-install bcmath

RUN apk add --update \
    		autoconf \
    		g++ \
    		libtool \
    		make \
    		libxml2 \
    		libxml2-dev \
    && docker-php-ext-install soap

RUN apk add --update \
        libpng \
		libpng-dev \
    && docker-php-ext-install gd

RUN apk add --update \
        gmp \
		gmp-dev \
		&& docker-php-ext-install gmp
RUN apk add --update \
        bzip2 \
		bzip2-dev \
    && docker-php-ext-install bz2

RUN docker-php-ext-install zip

RUN docker-php-ext-install mbstring

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
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/4.2.0.tar.gz \
        && tar xfz /tmp/redis.tar.gz \
        && rm -r /tmp/redis.tar.gz \
        && mkdir -p /usr/src/php/ext \
        && mv phpredis-* /usr/src/php/ext/redis \
    && docker-php-ext-install redis



#RUN apk --help --verbose
RUN apk del \
		autoconf \
		binutils \
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
		libxml2 \
		libxml2-dev \
        libpng \
        libpng-dev \
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
		zlib-dev \
	&& rm -rf /tmp/* /var/cache/apk/*