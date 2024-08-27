FROM ubuntu:jammy-20240808
RUN apt-get update \
    && apt-get -qq install -y --no-install-recommends ffmpeg \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 5050
