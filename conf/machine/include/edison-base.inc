include conf/machine/include/edison-default-settings.inc
include conf/machine/include/edison-default-versions.inc
include conf/machine/include/edison-default-providers.inc

X86ARCH32 ?= "i686"
require conf/machine/include/x86/arch-x86.inc

IMAGE_FSTYPES = "tar.bz2 ext4 toflash"

XSERVER = "xserver-xorg \
           xf86-input-keyboard \
           xf86-input-evdev \
           xf86-video-dummy \
"


KERNEL_IMAGETYPE = "bzImage"
MACHINE_FEATURES = "bluetooth alsa pci serial usbgadget usbhost wifi x86 ext3"
MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "bluetooth-rfkill-event"
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "u-boot-edison u-boot-fw-utils-edison kernel-modules sst-fw mcu-fw-bin mcu-fw-load"
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-bcm-bt-lpm bcm43340-bt"
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "bcm43340-mod bcm43340-fw"
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-g-multi"


