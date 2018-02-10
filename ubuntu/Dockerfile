FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

ENV WKHTMLTOPDF_VERSION 0.12.4

## For chinese user
#RUN sed -i "s/http:\/\/archive\.ubuntu\.com/http:\/\/mirrors\.aliyun\.com/g" /etc/apt/sources.list

RUN apt-get update \
    # Install needed packages
    && apt-get install -y --no-install-recommends xvfb wget unzip xz-utils wkhtmltopdf ca-certificates \
    && cd /tmp/ \
    # Install latest wkhtmltox
    && wget -q https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/${WKHTMLTOPDF_VERSION}/wkhtmltox-${WKHTMLTOPDF_VERSION}_linux-generic-amd64.tar.xz \
    && tar xf wkhtmltox-${WKHTMLTOPDF_VERSION}_linux-generic-amd64.tar.xz -C /usr/local/bin/ \
    && rm wkhtmltox-${WKHTMLTOPDF_VERSION}_linux-generic-amd64.tar.xz \
    # Install SourceHanSans fonts
    && mkdir /tmp/fonts \
    && mkdir -p /usr/share/fonts/SourceHanSans \
    && cd /tmp/fonts \
    && wget -q https://github.com/adobe-fonts/source-han-sans/raw/release/SuperOTC/SourceHanSans.ttc.zip \
    && unzip SourceHanSans.ttc.zip \
    && mv SourceHanSans.ttc /usr/share/fonts/SourceHanSans/ \
    && fc-cache \
    # Clean
    && rm -rf /tmp/* \
    && apt-get purge -y --auto-remove unzip xz-utils wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY scripts/* /usr/bin/

RUN chmod +x /usr/bin/wkhtmltopdf \
    && chmod +x /usr/bin/wkhtmltoimage
