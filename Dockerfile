# Image
FROM alpine:3.6

# Environment variables
ENV WKHTMLTOX_VERSION=0.12.4

# Copy patches
RUN mkdir -p /tmp/patches
COPY conf/* /tmp/patches/

# Install needed packages
RUN apk add --update --no-cache \
        xvfb \
        ttf-freefont \
        fontconfig \
        dbus \
        exiftool \
        wget \
        tzdata \
        ca-certificates

# Install wkhtmltopdf
RUN apk add --update \
            qt5-qtbase-dev \
            wkhtmltopdf \
            --no-cache \
            --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
            --allow-untrusted

# Initail dbus
RUN mkdir -p /var/lib/dbus && \
    dbus-uuidgen > /var/lib/dbus/machine-id

# Install SourceHanSans fonts
RUN mkdir /tmp/fonts && \
    mkdir -p /usr/share/fonts/SourceHanSans

RUN cd /tmp/fonts && \
    wget -q https://github.com/adobe-fonts/source-han-sans/raw/release/SuperOTC/SourceHanSans.ttc.zip && \
    unzip SourceHanSans.ttc.zip && \
    mv SourceHanSans.ttc /usr/share/fonts/SourceHanSans/ && \
    fc-cache

# Clean up when done
RUN rm -rf /tmp/* \
&& apk del .build-deps