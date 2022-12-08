# 笔记

## 推流

```sh
ffmpeg -re -rtsp_transport tcp -i "rtsp://admin:cz123456@192.168.1.18/LiveMedia/ch1/Media1" -f flv -vcodec libx264 -vprofile baseline -acodec aac -ar 44100 -strict -2 -ac 1 -f flv -flvflags no_duration_filesize  -s 1280x720 -q 10 "rtmp://127.0.0.1:1935/live/2"
```
