################################################################################
#
# libfslvpuwrap
#
################################################################################

<<<<<<< HEAD
LIBFSLVPUWRAP_VERSION = 1.0.45
LIBFSLVPUWRAP_SITE =  http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-1.0.45.bin
=======
LIBFSLVPUWRAP_VERSION = 1.0.46
LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
LIBFSLVPUWRAP_DEPENDENCIES = imx-vpu
LIBFSLVPUWRAP_INSTALL_STAGING = YES

>>>>>>> remotes/buildroot/master
LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
LIBFSLVPUWRAP_LICENSE_FILES = EULA EULA.txt
LIBFSLVPUWRAP_REDISTRIBUTE = NO

define LIBFSLVPUWRAP_EXTRACT_CMDS
	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE))
endef


define LIBFSLVPUWRAP_EXTRACT_CMDS
        (cd $(BUILD_DIR); \
		             sh $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) --force --auto-accept)

endef

$(eval $(autotools-package))
