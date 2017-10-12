# Image
FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

# Install needed packages
RUN apt-get update && \
    apt-get install -y wkhtmltopdf xvfb wget unzip

# Install SourceHanSans fonts
RUN mkdir /tmp/fonts && \
    mkdir -p /usr/share/fonts/SourceHanSans

RUN cd /tmp/fonts && \
    wget -q https://github.com/adobe-fonts/source-han-sans/raw/release/SuperOTC/SourceHanSans.ttc.zip && \
    unzip SourceHanSans.ttc.zip && \
    mv SourceHanSans.ttc /usr/share/fonts/SourceHanSans/ && \
    fc-cache

RUN mv /usr/bin/wkhtmltopdf /usr/bin/wkhtmltopdf-origin && \
    mv /usr/bin/wkhtmltoimage /usr/bin/wkhtmltoimage-origin

COPY scripts/* /usr/local/bin/

RUN  chmod +x /usr/bin/xvfb-run && \
     chmod +x /usr/bin/wkhtmltopdf && \
     chmod +x /usr/bin/wkhtmltoimage && \

# Clean up when done
RUN rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*