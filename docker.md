# Docker Commands Cheatsheet

## Basic commands

```sh
# Listing containers
docker ps # active running
  # -a = all
  # -q = just container name

# List existing local images
docker images

# Creating and running containers
docker run --name ctr-name image-name
# -d = detached mode
# -i = interactive
# -t = go to a terminal of the running container
#      Useful when non-OS, i.e. process-based ctr.
#      e.g. `docker run -it nginx bash`
# --mem 500M = limits to 500MB RAM
# --restart [restart-policy]
docker rename ctr-id new-ctr-name

# Other state change commands
docker start ctr-name # Run existing/stopped container
docker stop ctr-name
docker restart ctr-name
docker kill ctr-name # Gives Exit Code 137

# Go into container shell
docker exec -it ctr-name /bin/sh

# Exit container terminal: `Ctrl+P+Q`.

# Delete container
docker stop ctr-name
docker rm ctr-name [-f]
# Delete all
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
# Delete all stopped containers in one cmd
docker container prune
docker image prune [-a] # dangling images

# Info commands
docker inspect ctr-name # Container configuration details
docker logs [-f] # Logging
docker info # Docker installation info in host
docker stats # Resource allocation info
docker top ctr-name # List all top processes in this ctr
docker history image-name # what all happened
```

### Restart Policy

1. no
1. on-failure (for exit code != 0)
1. always
1. unless-stopped (unless manually stopped)

## Exposing application externally

```sh
# Port forwarding (auto:32768-65535)
# Should be done only when creating container
# Cannot be done once a container created
docker run -itd --name ctr-name -P img-name

# Port binding
docker run -itd --name ctr-name -p 81:80 img-name
# -p [external-port-number]:[internal-application-port-number]
# -p [IP]:[host-port]:[ctr-app-port]

# Check ports open
docker port ctr-name
```

## File-system Operations

```sh
# From host to ctr
docker cp [src-file-path-name] ctr-name:[dest-file-path-name]

# From ctr to host
docker cp ctr-name:[ctr-file-path-name] [host-path]
```

## Working with images

```sh
docker images
docker pull image-name-or-url
docker push image-repo/image-name
docker rmi image-name # Remove image
docker build

# Export/Import
docker export ctr-id # Exports containers filesystem to a .tar archive file
docker import name.tar # Imports .tar back into an image (not container)

# Alternative to storing image in docker public repo
docker save image-name:tag -o name.tar # Create convert image to tar file
docker load name.tar
```

### Creating a new image out of an already active container via CLI

```sh
docker run ...
# make changes to your container
# ...
docker commit ctr-name new-image-name
# -m "Commit message here"
# -c = Changes to command, e.g.
#      -c 'CMD /usr/bin/nginx -g "daemon off;"'
#      -c 'EXPOSE 80'
```

### Creating a new image via Docker file

1. Create a file named: `Dockerfile`. (No extensions)
2. Add layers and commands.
3. Run: `docker build -t ubuntu-nginx[:tagName] . [-f docker_file_name]`.

| Commands | Description |
| -------- | ----------- |
| FROM | Creates the bottom most layer of ubuntu 18.04 for the image |
| RUN | Installs apache httpd server on top of the ubuntu layer |
| COPY | Copies files from the local directory to the container |
| CMD | Specifies the command to run when the container is live |
| EXPOSE | Exposes the container port to the system |

## Storage in Docker

### Volumes

```powershell
docker volume create|inspect|rm <volumnName>
docker volume ls
```

### Mounts

### tmpfs
