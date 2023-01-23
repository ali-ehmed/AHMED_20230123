# Ahmed_20230123

A simple web application that allows a user to watch and upload videos.

### Pre-requisites
- Docker 20.10.16
- Docker compose 1.29.2

### Clone Repo
```shell
git clone git@github.com:ali-ehmed/ahmed_20230123.git
```

### Run containers
```shell
docker compose up -d
```

### Setup Database
```shell
docker-compose run backend make db_reset
```

### Visit `http://localhost:3000`

### Run tests
```shell
docker-compose run backend make test
```
