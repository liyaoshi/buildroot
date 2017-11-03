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
LIBGBM_DEPENDENCIES = libdrm udev 

define LIBGBM_RUN_AUTOGEN
	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
LIBGBM_PRE_CONFIGURE_HOOKS += LIBGBM_RUN_AUTOGEN
$(eval $(autotools-package))
