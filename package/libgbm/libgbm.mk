################################################################################
#
# c-periphery
#
################################################################################

LIBGBM_VERSION = 96f37555c7e82a417b02051661377b10e6b3966e
LIBGBM_SITE = git://git.ti.com/glsdk/libgbm.git
LIBGBM_INSTALL_STAGING = YES
# only a static library
LIBGBM_INSTALL_TARGET = YES
LIBGBM_LICENSE = MIT
LIBGBM_LICENSE_FILES = LICENSE
LIBGBM_DEPENDENCIES = libdrm udev ti-sgx-um

define LIBGBM_RUN_AUTOGEN
	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh 
endef

define LIBGBM_RUN_FIXMAKE
	$(SED) 's/\-O3/\-O0/' $(@D)/Makefile
endef

LIBGBM_PRE_BUILD_HOOKS += LIBGBM_RUN_FIXMAKE
LIBGBM_PRE_CONFIGURE_HOOKS += LIBGBM_RUN_AUTOGEN
$(eval $(autotools-package))
