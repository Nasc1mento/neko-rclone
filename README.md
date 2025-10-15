# Neko + Rclone

Scripts to run and clean a container with **Neko (Firefox)** and **Rclone**

## How to use

1. Clone:
```bash
git clone https://github.com/Nasc1mento/nekoRclone
```
2. Make the scripts executable:
```bash
chmod +x init.sh clear.sh wait-for-it.sh
```

## If you are using docker, run the following commands:
``` bash
sed -i 's/podman/docker/g' ./init.sh ./clear.sh
```
### Or if you want to revert:
``` bash
sed -i 's/docker/podman/g' ./init.sh ./clear.sh
```
