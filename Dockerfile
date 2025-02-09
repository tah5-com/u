FROM ubuntu:24.04

LABEL name="u"
LABEL description="ubuntu Docker Image"
LABEL license="MIT"
LABEL version="1.0"
LABEL maintainer="tah5.com <contact@tah5.com>"

ENV TZ=Asia/Tokyo
ENV LANGUAGE="ja_JP.UTF-8" \
    LANG="ja_JP.UTF-8"

WORKDIR /

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    && apt-get --quiet update \
    && apt-get --quiet install --yes \
    curl \
    git \
    vim \
    wget \
    zip \
    && apt-get clean \
    && rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

EXPOSE 80
CMD [ "bash" ]
