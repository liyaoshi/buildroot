################################################################################
#
#ipcdev from ti
#
################################################################################

IPCDEV_VERSION = 6a2595a4148fb12f259efc19164a9d33ad2ed294
IPCDEV_SITE =  git://git.ti.com/ipc/ipcdev
IPCDEV_LICENSE = GPL-2.0
IPCDEV_LICENSE_FILES = GPL-COPYING
IPCDEV_INSTALL_STAGING = YES

IPCDEV_DEPENDENCIES = linux

define IPCDEV_RUN_CONFIG
    cd $(@D) ; make -f ipc-linux.mak config  KERNEL_INSTALL_DIR=$(LINUX_DIR)  TOOLCHAIN_PREFIX=$(TARGET_CROSS) TOOLCHAIN_LONGNAME=arm-linux-gnueabihf  PLATFORM=OMAP54XX
endef

IPCDEV_POST_CONFIGURE_HOOKS += IPCDEV_RUN_CONFIG
define POSTGRESQL_INSTALL_IPCDEV_CONFIG
	 cd $(@D) ; cp -arf packages/ti $(STAGING_DIR)/usr/include ; cp -arvf $(@D)/linux/src/mm/libmmrpc.pc $(STAGING_DIR)/usr/lib/pkgconfig
endef
IPCDEV_POST_INSTALL_STAGING_HOOKS += POSTGRESQL_INSTALL_IPCDEV_CONFIG
$(eval $(autotools-package))

