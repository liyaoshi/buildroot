GSTREAMER_IMX_VERSION = 12fba1863e8dcde89d3d4f299eaaa5d2644da77b
GSTREAMER_IMX_SITE = https://github.com/Freescale/gstreamer-imx
GSTREAMER_IMX_SITE_METHOD = git

GSTREAMER_IMX_DEPENDENCIES = libfslvpuwrap gstreamer1

GSTREAMER_IMX_LICENSE = GPLv2
GSTREAMER_IMX_LICENSE_FILES = COPYING


define GSTREAMER_IMX_CONFIGURE_CMDS
        (cd $(@D);  $(TARGET_CONFIGURE_OPTS)\
	./waf configure \
	--prefix=/usr \
	--kernel-headers=${LINUX_DIR}/include \
	)
endef


define GSTREAMER_IMX_BUILD_CMDS
       (cd $(@D); ./waf build )
endef

define GSTREAMER_IMX__INSTALL_TARGET_CMDS
       (cd $(@D); ./waf --destdir=$(TARGET_DIR) install)
endef

$(eval $(generic-package))
