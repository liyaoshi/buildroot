################################################################################
#
# gst-fsl-plugins
#
################################################################################

GST1_FSL_PLUGINS_VERSION = 4.0.3
GST1_FSL_PLUGINS_SITE = $(FREESCALE_IMX_SITE)

# Most is LGPLv2+, but some sources are copied from upstream and are
# LGPLv2.1+, which essentially makes it LGPLv2.1+
GST1_FSL_PLUGINS_LICENSE = LGPLv2+, LGPLv2.1+, PROPRIETARY (asf.h)
GST1_FSL_PLUGINS_LICENSE_FILES = COPYING-LGPL-2.1 COPYING-LGPL-2

GST1_FSL_PLUGINS_INSTALL_STAGING = YES
GST1_FSL_PLUGINS_AUTORECONF = YES

GST1_FSL_PLUGINS_DEPENDENCIES += host-pkgconf gstreamer gst-plugins-base \
	libfslvpuwrap imx-lib imx-vpu libfslparser libfslcodec

GST1_FSL_PLUGINS_CONF_ENV = \
	PLATFORM=$(BR2_PACKAGE_GST1_FSL_PLUGINS_PLATFORM) \
	CROSS_ROOT="$(STAGING_DIR)"

# needs access to imx-specific kernel headers
GST1_FSL_PLUGINS_DEPENDENCIES += linux
GST1_FSL_PLUGINS_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -idirafter $(LINUX_DIR)/include/uapi"

ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
GST1_FSL_PLUGINS_DEPENDENCIES += xlib_libX11
GST1_FSL_PLUGINS_CONF_OPTS += --enable-x11
else
GST1_FSL_PLUGINS_CONF_OPTS += --disable-x11
endif

# Autoreconf requires an m4 directory to exist
define GST1_FSL_PLUGINS_PATCH_M4
	mkdir -p $(@D)/m4
endef

GST1_FSL_PLUGINS_POST_PATCH_HOOKS += GST_FSL_PLUGINS_PATCH_M4

$(eval $(autotools-package))
