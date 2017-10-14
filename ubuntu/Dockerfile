# Image
FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

## For chinese user
## RUN sed -i "s/http:\/\/archive\.ubuntu\.com/http:\/\/mirrors\.aliyun\.com/g" /etc/apt/sources.list

RUN apt-get update \
    # Install needed packages
    && apt-get install -y wkhtmltopdf xvfb wget unzip xz-utils ca-certificates \
    && cd /tmp/ \
    # Install latest wkhtmltox
    && wget -q https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz \
    && tar xf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz -C /usr/local/bin/ \
    && rm wkhtmltox-0.12.4_linux-generic-amd64.tar.xz \
    && rm /usr/bin/wkhtmltopdf \
    && rm /usr/bin/wkhtmltoimage \
    # Install SourceHanSans fonts
    && mkdir /tmp/fonts \
    && mkdir -p /usr/share/fonts/SourceHanSans \
    && cd /tmp/fonts \
    && wget -q https://github.com/adobe-fonts/source-han-sans/raw/release/SuperOTC/SourceHanSans.ttc.zip \
    && unzip SourceHanSans.ttc.zip \
    && mv SourceHanSans.ttc /usr/share/fonts/SourceHanSans/ \
    && fc-cache \
    # Clearn
    && rm -rf /tmp/* \
    && apt-get purge -y --auto-remove unzip xz-utils wget \
    && rm -rf /var/lib/apt/lists/*

COPY scripts/* /usr/bin/

RUN chmod +x /usr/bin/xvfb-run \
    && chmod +x /usr/bin/wkhtmltopdf \
    && chmod +x /usr/bin/wkhtmltoimage