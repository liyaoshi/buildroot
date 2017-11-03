################################################################################
#
# ti-gc320-lib
#
################################################################################

# This correpsonds to SDK 02.00.00.00
TI_GC320_LIB_VERSION = ab0ca5bff345f6c13807fea3c4acabf5f2b9b10a
TI_GC320_LIB_SITE =  git://git.ti.com/graphics/ti-gc320-libs.git
TI_GC320_LIB_LICENSE = TI TSPA License
TI_GC320_LIB_INSTALL_STAGING = YES

# ti-gc320-lib is a egl/gles provider only if libdrm is installed
TI_GC320_LIB_DEPENDENCIES = libdrm wayland libgbm ti-sgx-km


define TI_GC320_LIB_INSTALL_TARGET_CMDS

	cp -arf $(@D)/targetfs/jacinto6evm/lib/* $(TARGET_DIR)/usr/lib

endef




$(eval $(generic-package))
