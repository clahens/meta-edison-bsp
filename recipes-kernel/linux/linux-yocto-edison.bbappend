FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

### linux-stable/linux-4.4.y backports
SRC_URI_append_intel-edison = " file://0001-USB-usbip-fix-potential-out-of-bounds-write.patch"

### Config "fix" fragments

# security fixes
SRC_URI_append = " file://security.cfg"
SRC_URI_append_edison = " file://security-x86.cfg"
SRC_URI_append_edison = " file://edison-iptables.cfg"

### Hardware support fragments

# additional security hardware support
SRC_URI_append_intel-core2-32 = " file://security-tpm.cfg"

# I2C sensors
SRC_URI_append_edison = " file://sensors.cfg"


# user space SPI support
SRC_URI_append_edison = " file://uspi.cfg"


# NFC support and drivers
SRC_URI_append = " file://nfc.cfg"
SRC_URI_append_edison = " file://nfc-spi.cfg"

SRC_URI_append_edison = " file://nfc-i2c.cfg"

# USB-serial interface support and drivers
SRC_URI_append = " file://usb-serial.cfg"

# USB-ethernet support and drivers
SRC_URI_append = " file://usb-ethernet.cfg"

# CAN-bus support and drivers
SRC_URI_append = " file://can.cfg"
SRC_URI_append_edison = " file://can-spi.cfg"
SRC_URI_append_intel-core2-32 = " file://can-x86.cfg"

# RealTek WiFi chip used on Gigabyte GB-BXBT-3825
SRC_URI_append_intel-core2-32 = " file://wireless.cfg"

# 6lowpan support
SRC_URI_append = " file://6lowpan.cfg"

# 6lowpan over 802154 support and drivers
SRC_URI_append = " file://6lowpan-802154.cfg"

# 6lowpan over Bluetooth LE support
SRC_URI_append = " file://6lowpan-btle.cfg"

# Enable/disable GFX console and support as necessary
SRC_URI_append_intel-core2-32 = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' file://gfx.cfg', ' file://no-gfx.cfg', d)}"


KERNEL_MODULE_AUTOLOAD += "bcm_bt_lpm"
KERNEL_MODULE_AUTOLOAD  += "bcm4334x"
KERNEL_MODULE_PROBECONF += "bcm4334x"
module_conf_bcm4334x = "options bcm4334x firmware_path=/etc/firmware/fw_bcmdhd.bin nvram_path=/etc/firmware/bcmdhd.cal"

KERNEL_MODULE_AUTOLOAD  += "g_multi"
KERNEL_MODULE_PROBECONF += "g_multi"
# FIXME: file parameter should be based on partition UUID (from U-Boot) or fixed
# with label (label seems to work, but driver is probed too early)
module_conf_g_multi = "options g_multi file=/dev/mmcblk0p9 stall=0 idVendor=0x8087 idProduct=0x0A9E iProduct=Edison iManufacturer=Intel"

### Feature fragments

# Enable eCryptFS
SRC_URI_append = " file://ecryptfs.cfg"

# Backport ambient capabilities support
SRC_URI_append_edison = " file://0001-edison-capabilities-ambient-capabilities.patch"
SRC_URI_append_edison = " file://0002-edison-capabilities-add-a-securebit-to-disable-PR_CAP_AMBIE.patch"

# Enable the necessary options for systemd-nspawn'd containers.
SRC_URI_append = " \
    file://nspawn-fs.cfg \
    file://nspawn-netdev.cfg \
    file://nspawn-firewall.cfg \
    file://nspawn-devpts.cfg \
"

# Workaround for IMA/overlayfs deadlock.

SRC_URI_append_intel-core2-32 = " \
    file://0001-ovl-setxattr-don-t-deadlock-when-called-from-ima_fix.patch \
"

# lockdep and kernel debugging
# SRC_URI_append = "  file://lockdep.cfg file://debug-kernel.cfg"
