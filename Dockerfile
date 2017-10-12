# Image
FROM alpine:3.6

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

# Wrapper for xvfb
RUN  mv /usr/bin/wkhtmltopdf /usr/bin/wkhtmltopdf-origin && \
    echo $'#!/usr/bin/env sh\n\
Xvfb :0 -screen 0 1024x768x24 -ac +extension GLX +render -noreset & \n\
DISPLAY=:0.0 wkhtmltopdf-origin $@ \n\
killall Xvfb\
' > /usr/bin/wkhtmltopdf && \
    chmod +x /usr/bin/wkhtmltopdf && \
    mv /usr/bin/wkhtmltoimage /usr/bin/wkhtmltoimage-origin && \
    echo $'#!/usr/bin/env sh\n\
Xvfb :0 -screen 0 1024x768x24 -ac +extension GLX +render -noreset & \n\
DISPLAY=:0.0 wkhtmltoimage-origin $@ \n\
killall Xvfb\
' > /usr/bin/wkhtmltoimage && \
    chmod +x /usr/bin/wkhtmltoimage

# Clean up when done
RUN rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*