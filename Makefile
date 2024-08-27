.PHONY build run:

build:
	docker build -t ffmpeg_server .

run:
	docker run -d --rm ffmpeg_server ffmpeg -re -listen 1 -i rtmp://127.0.0.1:5050/ -c:v rawvideo -an -pix_fmt yuyv422 -f v4l2 /dev/video2
