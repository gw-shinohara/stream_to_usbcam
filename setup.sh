sudo apt-get update
sudo apt-get install -y v4l2loopback-dkms v4l2loopback-utils

sudo /usr/sbin/modprobe v4l2loopback
