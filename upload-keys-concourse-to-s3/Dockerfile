FROM alpine:latest

RUN \
  apk update \
	&& apk -Uuv add groff less python py-pip openssh-client ca-certificates wget \
	&& update-ca-certificates \
	&& pip install awscli \
	&& apk --purge -v del py-pip \
	&& rm /var/cache/apk/*

COPY script.sh /scripts/

WORKDIR /scripts

CMD ["sh", "-c", "/scripts/script.sh"]