# Ahmed_20230123

A simple web application that allows a user to watch and upload videos.

### Languages & Frameowkrs
- <img src="https://upload.wikimedia.org/wikipedia/commons/1/16/Ruby_on_Rails-logo.png" style="height: 15px; width:15px;"/> Ruby on Rails 7
- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Postgresql_elephant.svg/1985px-Postgresql_elephant.svg.png" style="height: 15px; width:15px;"/> PostgreSQL 14
- <img src="https://raw.githubusercontent.com/webpack/media/master/logo/icon-square-big.png" style="height: 15px; width:15px;"/> Webpack ^5
- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/2300px-React-icon.svg.png" style="height: 15px; width:15px;"/> React 18
- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Typescript_logo_2020.svg/2048px-Typescript_logo_2020.svg.png" style="height: 15px; width:15px;"/> Typescript ^4
- <img src="https://gw.alipayobjects.com/zos/rmsportal/KDpgvguMpGfqaHPjicRK.svg" style="height: 15px; width:15px;"/> Ant Design React UI

### Pre-requisites
- Docker 20.10.16
- Docker compose 1.29.2

### Clone Repo
```shell
git clone git@github.com:ali-ehmed/AHMED_20230123.git && cd ahmed_20230123
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
```shell
open http://localhost:3000
```

### Run tests
```shell
docker-compose run backend make test
```
