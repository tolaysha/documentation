FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    x11-utils \
    xvfb \
    libgtk-3-0 \
    libxss1 \
    libasound2 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxrandr2 \
    libxkbcommon0 \
    libxkbcommon-x11-0 \
    libxshmfence1 \
    libxinerama1 \
    libgl1-mesa-glx \
    libglib2.0-0 \
    ca-certificates \
    git \
    curl

# Установим Draw.io
RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v21.7.2/drawio-amd64-21.7.2.deb && \
    apt install -y ./drawio-amd64-21.7.2.deb && \
    rm drawio-amd64-21.7.2.deb

# Скопируем скрипт экспорта
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
