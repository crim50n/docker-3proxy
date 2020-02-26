FROM alpine

ENV _3PROXY_VERSION 0.8.13
ENV _3PROXY_DOWNLOAD_URL https://github.com/z3APA3A/3proxy/archive/"$_3PROXY_VERSION".tar.gz
#ENV _3PROXY_DOWNLOAD_SHA1 382226570dca6632f429d2036becde9b89f9341f

RUN set -ex \
	\
	&& apk add --no-cache --virtual .build-deps \
		gcc \
		linux-headers \
		make \
		musl-dev \
		tar \
		openssl \
	\
	&& wget -O 3proxy.tar.gz "$_3PROXY_DOWNLOAD_URL" \
#	&& echo "$_3PROXY_DOWNLOAD_SHA1 *3proxy.tar.gz" | sha1sum -c - \
	&& mkdir -p /usr/src/3proxy \
	&& tar -xzf 3proxy.tar.gz -C /usr/src/3proxy --strip-components=1 \
	&& rm 3proxy.tar.gz \
	\
	&& make -C /usr/src/3proxy -f Makefile.Linux \
	&& make -C /usr/src/3proxy -f Makefile.Linux install \
	\
	&& rm -r /usr/src/3proxy \
	\
	&& apk del .build-deps

COPY 3proxy.cfg /etc
EXPOSE 1080
EXPOSE 8080
ENTRYPOINT ["3proxy", "/etc/3proxy.cfg"]
