# Base this image on edison-basic-image
include edison-basic-image.bb

IMAGE_FEATURES += "tools-sdk dev-pkgs tools-debug tools-profile"
