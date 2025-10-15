FROM ghcr.io/m1k1o/neko/firefox:latest
USER root
RUN apt update && apt install rclone
