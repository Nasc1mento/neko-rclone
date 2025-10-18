#!/usr/bin/env bash

CONFIG_DIR="$HOME/.config/neko-rclone"
HOST_IP="$(ip route get 1 | awk '{ print $7; exit }')"

echo "CONFIG_DIR=$CONFIG_DIR" > .env
echo "Config dir at: $CONFIG_DIR"
echo "HOST_IP=$HOST_IP" >> .env
echo "Host IP Detected: $HOST_IP"

echo "Starting containers..."
podman-compose up -d
./wait-for-it.sh localhost:8080 -t 60 >/dev/null 2>&1
echo "Neko is online at: http://localhost:8080"

echo "Starting Rclone config..."
podman exec -it neko-rclone rclone config
echo "Complete. rclone configuration done!"
