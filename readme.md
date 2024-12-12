# Docker
Docker is a software platform that allows you to build, test, and deploy applications quickly. Docker packages software into standardized units called containers that have everything the software needs to run including libraries, system tools, code, and runtime. Using Docker, you can quickly deploy and scale applications into any environment and know your code will run.

#### Problem
Software often works on the developer's machine but fails on other environments (e.g., testing, production) due to differences in operating systems, libraries, or configurations.
#### Solution
Containers isolate applications and their dependencies, allowing multiple applications with conflicting requirements to coexist on the same system.

## Image v/s Container
#### Image:
A Docker image is a lightweight, standalone, and immutable file that includes: 
- The application code
- System libraries and dependencies.
```bash
# List all available images present on your system
docker images

# Download image from docker hub
docker pull <image-name>:<tag>
docker pull rabbitmq:latest

# Build a docker image from Dockerfile
docker build -t <image-name>:<tag> <path>
docker build -t hello-node-server .

# Delete a image from a system
docker rmi <image-id or image-name>

# Uploads a tagged image to a registry like Docker Hub or a private registry.
docker push <image-name>:<tag>

# Displays detailed metadata about the image.
docker inspect <image-name or image-id>

# Removes dangling or unused images.
docker image prune
```

#### Container:
A Docker container is a runtime instance of a Docker image
```bash
# Creates and starts a new container from an image.
docker run <image-name>
docker run hello-node-server

# Show all running containers
docker ps

# Display both runnig and stopped container
docker ps -a

# Start a stopped container
docker start <container-id or name>

# Stop a running container
docker stop <container-id or name>

# Deletes a stopped container
docker rm <container-id or name>

# View log of a container
docker logs <container-id or name>

# Execute a Command in a Running Container:
# Example: docker exec -it my-container bash opens an interactive shell inside the container.
docker exec -it <container-id or name> <command>

# Displays detailed information about the container
docker inspect <container-id or name>

# Stop and remove all containers
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)

# Run the container in the backgroud
docker run -d <image-name>

# Map the container running port to the local port
docker run -it -p 8000:8000 hello-node-server
```

## Docker compose
If you've been following the guides so far, you've been working with single container applications. But, now you're wanting to do something more complicated - run databases, message queues, caches, or a variety of other services. Do you install everything in a single container? Run multiple containers? If you run multiple, how do you connect them all together?

One best practice for containers is that each container should do one thing and do it well. While there are exceptions to this rule, avoid the tendency to have one container do multiple things.

You can use multiple docker run commands to start multiple containers. But, you'll soon realize you'll need to manage networks, all of the flags needed to connect containers to those networks, and more. And when you're done, cleanup is a little more complicated.

With Docker Compose, you can define all of your containers and their configurations in a single `YAML` file. If you include this file in your code repository, anyone that clones your repository can get up and running with a single command.

It's important to understand that Compose is a declarative tool - you simply define it and go. You don't always need to recreate everything from scratch. If you make a change, run `docker compose up` again and Compose will reconcile the changes in your file and apply them intelligently.

```bash
# Starts the services defined in the docker-compose.yml file.
docker compose up
# Common Flags:
# -d (detached mode): Run containers in the background.
#--build: Rebuild images before starting containers.
docker compose up -d

# Stops and removes all containers, networks, and volumes defined in the docker-compose.yml file.
docker compose down
```