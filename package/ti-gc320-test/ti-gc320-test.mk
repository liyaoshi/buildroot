################################################################################
#
# ti-gc320-test
#
################################################################################

# This correpsonds to SDK 02.00.00.00
TI_GC320_TEST_VERSION = 53207f8e360a3336276b62066a1d8a9e923de17e
TI_GC320_TEST_SITE =   git://git.ti.com/graphics/ti-gc320-test.git
TI_GC320_TEST_LICENSE = TI TSPA License

# ti-gc320-lib is a egl/gles provider only if libdrm is installed
TI_GC320_TEST_DEPENDENCIES = ti-gc320-lib

define TI_GC320_TEST_INSTALL_TARGET_CMDS
	cp -arf $(@D)/targetfs/jacinto6evm/lib/* $(TARGET_DIR)/usr/lib
endef
$(eval $(generic-package))
