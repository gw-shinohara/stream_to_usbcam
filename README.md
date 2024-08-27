# Stream to usbcam
Publish the captured stream to /dev/video.

Straem source required rtmp stream.

# Requirement
- docker
- make

# Setup env
1. Install v4l2loopback
2. Make virtual camera
```
bash setup.sh
``
3. Build docker image
```
make build
```

4. Launch virtual camera
```
make run
```
