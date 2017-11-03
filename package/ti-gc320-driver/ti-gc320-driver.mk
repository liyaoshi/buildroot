################################################################################
#
# ti-sgx-km
#
################################################################################

# This correpsonds to SDK 02.00.00.00
TI_GC320_DRIVER_VERSION = 295443bf56f2100b7b2714c2c30b31ba86e96a0c
TI_GC320_DRIVER_SITE = git://git.ti.com/graphics/ti-gc320-driver.git
TI_GC320_DRIVER_LICENSE = GPLv2
TI_GC320_DRIVER_LICENSE_FILES = GPL-COPYING

TI_GC320_DRIVER_DEPENDENCIES = linux ti-sgx-km

TI_GC320_DRIVER_MAKE_OPTS = \
	$(LINUX_MAKE_FLAGS) \
	KERNELDIR=$(LINUX_DIR) 

define TI_GC320_DRIVER_BUILD_CMDS
	cd $(@D)/src ; ARCH=arm make -C $(LINUX_DIR)  M=$(@D)/src AQROOT=$(@D)/src CROSS_COMPILE=$(TARGET_CROSS) 
endef

define TI_GC320_DRIVER_INSTALL_TARGET_CMDS
	cp -arf $(@D)/src/galcore.ko $(TARGET_DIR)/lib/modules/
endef

$(eval $(generic-package))
