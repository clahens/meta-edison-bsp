# Base this image on rpi-hwup-image
include edison-hwup-image.bb

IMAGE_FEATURES += "ssh-server-dropbear"

IMAGE_INSTALL += "kernel-dev"
