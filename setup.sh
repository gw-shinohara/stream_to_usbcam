#!/bin/bash
set -e

echo "--- Starting Virtual Camera Setup ---"

# --- 1. Install Dependencies ---
echo "[1/3] Installing required packages (ffmpeg, v4l2loopback-dkms)..."
sudo apt-get update
sudo apt-get install -y ffmpeg v4l2loopback-dkms v4l2loopback-utils
echo "Packages installed successfully."

# --- 2. Configure Kernel Module ---
echo "[2/3] Configuring v4l2loopback kernel module..."

# Ensure the module loads on boot
echo "v4l2loopback" | sudo tee /etc/modules-load.d/v4l2loopback.conf

# Set module options to create /dev/video2 consistently
# exclusive_caps=1 helps with compatibility with apps like Chrome/Zoom
CONF_LINE="options v4l2loopback video_nr=2 card_label='Virtual Camera' exclusive_caps=1"
echo "${CONF_LINE}" | sudo tee /etc/modprobe.d/v4l2loopback.conf

echo "Kernel module configured."

# --- 3. Load Kernel Module ---
echo "[3/3] Loading the kernel module..."

# Unload the module if it's already loaded, to apply new settings
# The '|| true' prevents the script from exiting if the module is not loaded
sudo modprobe -r v4l2loopback || true

# Load the module with the new configuration
sudo modprobe v4l2loopback

echo "--- Setup Complete! ---"
echo "Virtual camera device should now be available at /dev/video2."
ls -l /dev/video2
