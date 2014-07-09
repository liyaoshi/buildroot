################################################################################
#
# libfslvpuwrap
#
################################################################################

LIBFSLVPUWRAP_VERSION = 1.0.45
LIBFSLVPUWRAP_SITE =  http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-1.0.45.bin
LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
LIBFSLVPUWRAP_LICENSE_FILES = EULA.txt
LIBFSLVPUWRAP_REDISTRIBUTE = NO

LIBFSLVPUWRAP_INSTALL_STAGING = YES

LIBFSLVPUWRAP_DEPENDENCIES += imx-lib


define LIBFSLVPUWRAP_EXTRACT_CMDS
        (cd $(BUILD_DIR); \
		             sh $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) --force --auto-accept)

endef

$(eval $(autotools-package))
