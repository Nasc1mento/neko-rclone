#!/usr/bin/env bash
CONFIG_DIR="$HOME/.config/neko-rclone"
echo "CONFIG_DIR=$HOME/.config/neko-rclone" > .env
echo "Config dir at $CONFIG_DIR"
HOST_IP=$(ip route get 1 | awk '{print $7; exit}')
echo "HOST_IP=$HOST_IP" > .env
echo "Host IP detectado: $HOST_IP"
echo "Starting containers..."
podman-compose up -d
./wait-for-it.sh localhost:8080 -t 60 >/dev/null 2>&1
echo "Neko is online at http://localhost:8080"
echo "Staring Rclone config..."
podman exec -it neko-rclone rclone config
echo "Complete. After rclone config done, "
