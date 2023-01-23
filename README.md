# Ahmed_20230123

A simple web application that allows a user to watch and upload videos.

### Pre-requisites

- FFMPEG: This application capture previews from uploaded videos using ffmpeg tool. Install ffmpeg via `brew install ffmpeg` otherwise there might be some errors in displaying video thumbnails.
- Image Magic: Videos have previewable thumbnails in different sizes that are generated using image-magic tool. Install image magic via `brew install imagemagick`.
- Ruby 3.0.3
- Rails: 7.0.4.1
- PostgreSQL 14.6
- Makefile


### Clone Repo
```shell
git clone git@github.com:ali-ehmed/ahmed_20230123.git
```

### Setup Application
```shell
make application_setup
```

### Start Server
```shell
make server
```

### Start Frontend
```shell
make frontend
```

### Run tests
```shell
make test
```
