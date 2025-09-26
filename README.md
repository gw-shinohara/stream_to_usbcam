# Stream to usbcam

Publish the captured stream to /dev/video.

Straem source required rtmp stream.

# Requirement

* ffmpeg

* v4l2loopback

# Setup env

1. Install dependencies and create virtual camera.
   *This will create a virtual camera device at /dev/video2.*

```
bash setup.sh
```

# How to run

1. Launch the streaming script.
   *This will wait for an RTMP stream on port 5050.*

```
bash run.sh
```

2. From another terminal, send your video stream to the script.
   *Example using a test video source:*
```
ffmpeg -re -f lavfi -i testsrc=size=1280x720:rate=30 -c:v libx264 -pix_fmt yuv420p -f flv rtmp://127.0.0.1:5050/
```

# Cleanup

To remove the virtual camera, run the following command.

```
bash cleanup.sh
```