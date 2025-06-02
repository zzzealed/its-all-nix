% docker
# List containers running
```sh
docker ps
```

% docker, compose
# Bring up container and detach
```sh
docker compose up -d
```

% docker, compose, logs
# Follow logs
```sh
docker compose logs -f
```

% docker, compose, logs
# Reacreate and follow logs
```sh
docker compose up -d --force-recreate && docker compose logs -f
```

% docker, garbage
# Remove unused images, stopped containers, unused networks and unused volumes.
```sh
docker system prune --all --volumes
```

% docker, shell
# Enter container shell
```sh
docker exec -it <name> /bin/sh
```
$ name: docker ps -a --format '{{.Names}}'
