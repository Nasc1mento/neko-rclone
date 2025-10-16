# Neko + Rclone

I created this setup because I wanted to complete the [**Rclone**](https://rclone.org/) OAuth authentication process directly through the [**Neko**](https://neko.m1k1o.net/) (Firefox) browser inside the container.
---

## What each script does

- **init.sh** → Initializes the container with Neko and Rclone.  
- **clear.sh** → Cleans up and removes the container.  
- **wait-for-it.sh** → Helper script that waits for a service to be available before continuing (useful for Rclone or web services).

---

## How to use

### 1. Clone the repository
git clone https://github.com/Nasc1mento/nekoRclone
cd nekoRclone

### 2. Make the scripts executable
chmod +x init.sh clear.sh wait-for-it.sh

### 3. Start the container
./init.sh
> This script will create and run a container with Neko (Firefox) and Rclone ready to use.

### 4. Clean the container
./clear.sh
> Removes the container and cleans up any temporary files created.

---

## Using Docker (optional)

If you prefer to use **Docker** instead of Podman, replace the commands in `init.sh` and `clear.sh`:

`sed -i 's/podman/docker/g' ./init.sh ./clear.sh`

### Reverting to Podman
If you want to switch back to Podman, simply do the reverse:

`sed -i 's/docker/podman/g' ./init.sh ./clear.sh`

---

## Rclone Usage Examples (inside the container)

All Rclone commands must be executed **inside the container** using `podman exec`  
(or `docker exec`, if you replaced Podman with Docker).

##### List configured remotes

`podman exec -it neko-rclone rclone listremotes`

#### Copy OneDrive files to GoogleDrive shared folder
`podman exec -it neko-rclone rclone copy "<onedrive-name-config>:/path/to/file-or-folder" <google-drive-name-config> ----drive-root-folder-id <shared-folder-id> --progress`



