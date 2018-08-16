################################################################################
#
# ti-gc320-test
# make -f makefile.linux ARCH_TYPE=armv7-a CPU_TYPE=cortex-a15  VIVANTE_SDK_INC=/home/xhuang10/github/ti-gc320-test/sdk/include VIVANTE_SDK_LIB=/home/xhuang10/github/ti-gc320-lib/targetfs/jacinto6evm/lib EGL_API_FB=1 SDK_DIR=/home/xhuang10/github/ti-gc320-test/sdk VIVANTE_SDK_DIR=/home/xhuang10/github/ti-gc320-test/sdk OBJ_DIR=/home/xhuang10/github/ti-gc320-test/sdk/samples/hal/unit_test

################################################################################

# This correpsonds to SDK 02.00.00.00
TI_GC320_TEST_VERSION = 53207f8e360a3336276b62066a1d8a9e923de17e
TI_GC320_TEST_SITE =   git://git.ti.com/graphics/ti-gc320-test.git
TI_GC320_TEST_LICENSE = TI TSPA License

# ti-gc320-lib is a egl/gles provider only if libdrm is installed
TI_GC320_TEST_DEPENDENCIES = ti-gc320-lib

define TI_GC320_TEST_BUILD_CMDS
	cd $(@D)/tests/src;  AQROOT=$(@D)/tests/src make -f makefile.linux CROSS_COMPILE=$(TARGET_CROSS) ARCH_TYPE=armv7-a CPU_TYPE=cortex-a9 VIVANTE_SDK_DIR=$(@D)/sdk VIVANTE_SDK_INC=$(@D)/sdk/include VIVANTE_SDK_LIB=$(STAGING_DIR)/usr/lib DESTDIR=$(STAGING_DIR) SDK_DIR=$(@D)/tests/ EGL_API_FB=1 AQROOT=$(@D)/tests/src OBJ_DIR=$(@D)/sdk/samples/hal/unit_test

endef
$(eval $(generic-package))
