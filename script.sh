#!/bin/bash
HOST_IP=$(ip route get 1 | awk '{print $7; exit}')
echo "HOST_IP=$HOST_IP" > .env
podman-compose up -d
