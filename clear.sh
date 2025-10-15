#!/usr/bin/env bash

CONFIG_DIR="$HOME/.config/neko-rclone"
echo "Cleaning..."
if podman ps | grep -q "neko-rclone"; then
  echo "Stoping containers..."
  podman-compose down >/dev/null 2>&1 || podman stop neko-rclone >/dev/null 2>&1
else
  echo "No container Neko + Rclone running."
fi

echo "Removing image and volumes"
podman rm -f $(podman ps -aq --filter name=neko) >/dev/null 2>&1
podman volume rm -f $(podman volume ls -q --filter name=neko) >/dev/null 2>&1
if [ -f ".env" ]; then
  echo "Deleting .env file..."
  rm -f .env
fi
if [ -d "$CONFIG_DIR" ]; then
  read -p "Do you want to delete app directory:$CONFIG_DIR? (y/n): " CONFIRM
  if [[ "$CONFIRM" =~ ^[yY]$ ]]; then
    echo "Deleting $CONFIG_DIR..."
    rm -rf "$CONFIG_DIR"
  fi
fi

read -p "Do you want to remove local image 'localhost/neko-rclone'? (y/n): " REMOVE_IMG
if [[ "$REMOVE_IMG" =~ ^[yY]$ ]]; then
  echo "Removing local image"
  podman rmi -f localhost/neko-rclone >/dev/null 2>&1
fi

echo "Complete"
