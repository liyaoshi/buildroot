################################################################################
#
# ti-gc320-lib
#
################################################################################

# This correpsonds to SDK 02.00.00.00
TI_GC320_LIB_VERSION = c0afab259de59909cfe74c01f3f7fbaa147f94b5
TI_GC320_LIB_SITE = git://git.ti.com/graphics/ti-gc320-libs.git
TI_GC320_LIB_LICENSE = GPL
TI_GC320_LIB_INSTALL_STAGING = YES

# ti-gc320-lib is a egl/gles provider only if libdrm is installed
TI_GC320_LIB_DEPENDENCIES = libdrm wayland libgbm ti-sgx-km

define TI_GC320_LIB_INSTALL_TARGET_CMDS
	cp -arf $(@D)/targetfs/jacinto6evm/lib/* $(TARGET_DIR)/usr/lib
endef

define TI_GC320_LIB_INSTALL_STAGING_CMDS
	cp -arf $(@D)/targetfs/jacinto6evm/lib/* $(STAGING_DIR)/usr/lib
	cp -arf $(@D)/targetfs/jacinto6evm/include/* $(STAGING_DIR)/usr/include
endef

$(eval $(generic-package))
