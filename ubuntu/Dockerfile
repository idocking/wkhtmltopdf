# Image
FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

COPY scripts/* /usr/bin/

# Install needed packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends wkhtmltopdf xvfb wget unzip xz-utils \
    && cd /tmp/ \
    && wget -q https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz \
    && tar xf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz -C /usr/local/bin/ \
    && rm wkhtmltox-0.12.4_linux-generic-amd64.tar.xz \
    && rm /usr/bin/wkhtmltopdf \
    && rm /usr/bin/wkhtmltoimage \
    && chmod +x /usr/bin/xvfb-run \
    && chmod +x /usr/bin/wkhtmltopdf \
    && chmod +x /usr/bin/wkhtmltoimage \
    # Install SourceHanSans fonts
    && mkdir /tmp/fonts \
    && mkdir -p /usr/share/fonts/SourceHanSans \
    && cd /tmp/fonts \
    && wget -q https://github.com/adobe-fonts/source-han-sans/raw/release/SuperOTC/SourceHanSans.ttc.zip \
    && unzip SourceHanSans.ttc.zip \
    && mv SourceHanSans.ttc /usr/share/fonts/SourceHanSans/ \
    && fc-cache \
    && rm -rf /tmp/* \
    && apt-get purge -y --auto-remove unzip xz-utils wget\
    && rm -rf /var/lib/apt/lists/*