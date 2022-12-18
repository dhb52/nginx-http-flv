# 笔记

## 推流

```sh
ffmpeg -re -rtsp_transport tcp -i "rtsp://admin:cz123456@192.168.1.18/LiveMedia/ch1/Media1" -f flv -vcodec libx264 -vprofile baseline -acodec aac -ar 44100 -strict -2 -ac 1 -f flv -flvflags no_duration_filesize  -s 1280x720 -q 10 "rtmp://127.0.0.1:1935/live/2"
```

[下载 demo.flv](https://s3plus.meituan.net/v1/mss_7e425c4d9dcb4bb4918bbfa2779e6de1/mpack/default/demo.flv)

```sh
ffmpeg -re -stream_loop -1 -i demo.flv -c copy -f flv rtmp://127.0.0.1:1935/live/test
```

## Docker build

```sh
docker build -t dhb52/nginx-http-flv -f Dockerfile .
```

## Docker run

```sh
docker run -d -p 8080:80 -p 1935:1935 -v $PWD/nginx.conf:/etc/nginx/nginx.conf -v $PWD/data/flv:/data/flv -v $PWD/data/hls:/data/hls -v $PWD/data/www:/data/www -v $PWD/data/www/rtmp:/data/www/rtmp -v $PWD/data/logs:/usr/local/nginx/logs --name nginx-http-flv dhb52/nginx-http-flv
```

```sh
get_customer_url() {
  local SECRET=${2:-MD5_SECRET}
  local EXPIRES="$(date -d "today + 30 minutes" +%s)";
  local token="$(echo -n "${EXPIRES} ${SECRET}" | openssl md5 -binary | openssl base64 | tr +/ -_ | tr -d =)"
  echo "http://127.0.0.1:8080/video/hls/${token}/${EXPIRES}/live.m3u8"
}

get_customer_url
```
