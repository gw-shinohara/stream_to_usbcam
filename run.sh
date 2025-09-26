#!/bin/bash
set -e

# RTMPストリームをリッスンし、仮想カメラ(/dev/video2)に出力
ffmpeg -re -listen 1 -i rtmp://127.0.0.1:5050/ -c:v rawvideo -an -pix_fmt yuyv422 -f v4l2 /dev/video2
