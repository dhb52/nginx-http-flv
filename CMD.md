# Docker

## Build

```sh
docker build -t dhb52/nginx-http-flv -f Dockerfile.http-flv .
```

## Run

```sh
docker run -d -p 8080:80 -p 1935:1935 -v $PWD/tmp:/tmp -v $PWD/www:/var/www -v $PWD/logs:/usr/local/nginx/logs --name nginx-http-flv dhb52/nginx-http-flv
```
