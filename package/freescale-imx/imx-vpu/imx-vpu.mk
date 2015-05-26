################################################################################
#
# imx-vpu
#
################################################################################

IMX_VPU_VERSION = $(FREESCALE_IMX_VERSION)
<<<<<<< HEAD
IMX_VPU_SITE    = $(FREESCALE_IMX_MIRROR_SITE)
IMX_VPU_SOURCE  = imx-vpu-3.10.17-1.0.0.bin
IMX_VPU_LICENSE = LGPLv2.1+
# No license file included
=======
IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
>>>>>>> remotes/buildroot/master

IMX_VPU_INSTALL_STAGING = YES

# imx-vpu needs access to imx-specific kernel headers
IMX_VPU_DEPENDENCIES += linux
<<<<<<< HEAD
IMX_VPU_INCLUDE = \
	-I$(LINUX_DIR)/include/uapi \
	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
	-idirafter $(LINUX_DIR)/include

=======
>>>>>>> remotes/buildroot/master
IMX_VPU_MAKE_ENV = \
	$(TARGET_MAKE_ENV) \
	$(TARGET_CONFIGURE_OPTS) \
	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
<<<<<<< HEAD
	PLATFORM=$(BR2_PACKAGE_IMX_VPU_PLATFORM) \
	INCLUDE="$(IMX_VPU_INCLUDE)"

define IMX_VPU_EXTRACT_CMDS
 	(cd $(BUILD_DIR); \
	     sh $(DL_DIR)/$(IMX_VPU_SOURCE) --force --auto-accept)

=======
	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM) \
	INCLUDE="-idirafter $(LINUX_DIR)/include"

IMX_VPU_LICENSE = Freescale Semiconductor Software License Agreement
IMX_VPU_LICENSE_FILES = EULA vpu/EULA.txt
IMX_VPU_REDISTRIBUTE = NO

define IMX_VPU_EXTRACT_CMDS
	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_VPU_SOURCE))
>>>>>>> remotes/buildroot/master
endef

define IMX_VPU_BUILD_CMDS
	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D)
endef

define IMX_VPU_INSTALL_STAGING_CMDS
	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(STAGING_DIR) install
endef

define IMX_VPU_INSTALL_TARGET_CMDS
	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))
