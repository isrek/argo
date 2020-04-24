FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y curl && \
    curl 'https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb' --output cloudflared.deb  && \
    dpkg -i cloudflared.deb && \
    rm cloudflared.deb && \
    mkdir /app && \
    mkdir /etc/cloudflared

COPY entrypoint.sh /app

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT [ "/app/entrypoint.sh" ]
