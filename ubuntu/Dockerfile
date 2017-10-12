# Image
FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

# Install needed packages
RUN apt-get update && \
    apt-get install -y wkhtmltopdf xvfb wget unzip xz-utils

# Install SourceHanSans fonts
RUN mkdir /tmp/fonts && \
    mkdir -p /usr/share/fonts/SourceHanSans

RUN cd /tmp/ && \
    wget -q https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz && \
	tar xf -C /usr/local/bin/ && \
	rm /usr/bin/wkhtmltopdf && \
	rm /usr/bin/wkhtmltoimage

RUN cd /tmp/fonts && \
    wget -q https://github.com/adobe-fonts/source-han-sans/raw/release/SuperOTC/SourceHanSans.ttc.zip && \
    unzip SourceHanSans.ttc.zip && \
    mv SourceHanSans.ttc /usr/share/fonts/SourceHanSans/ && \
    fc-cache

COPY scripts/* /usr/bin/

RUN  chmod +x /usr/bin/xvfb-run && \
     chmod +x /usr/bin/wkhtmltopdf && \
     chmod +x /usr/bin/wkhtmltoimage

# Clean up when done
RUN rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*