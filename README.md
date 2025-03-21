# 10Play Video Downloader

## About
This is a Dockerized  GUI for <a href="https://github.com/billybanana80/ozivine">Ozivine</a>. 

## Features
Downloads videos from 10 Play

## Future Features
Downloading for all supported Ozivine services. 

## Requirements
You will need a 10Play account.

## How to run the app

### Docker Run

https://hub.docker.com/r/deanj93/ozivine-10play

docker run -d \
  --name=10PlayDownloader \
  -p 7023:7023 \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -v path/to/config//10PlayDownloader/config:/config \
  -v path/to/download/10Play/app/downloads:/app/downloads \
  --restart unless-stopped \
  deanj93/ozivine-10play:latest

### Docker Compose

services:
  10play:
    image: deanj93/ozivine-10play  # Uses the pre-built image from Docker Hub
    container_name: 10play_container
    ports:
      - "7023:7023"  # Maps port 7023 on the host to port 7023 in the container
    environment:
      N_m3u8DL-RE: "/app/linux/N_m3u8DL-RE_Beta_linux-x64/N_m3u8DL-RE"
    volumes:
      - c:\downloads\:/app/downloads  # Mounts the local Downloads folder to /app/downloads in the container
    stdin_open: true
    tty: true
