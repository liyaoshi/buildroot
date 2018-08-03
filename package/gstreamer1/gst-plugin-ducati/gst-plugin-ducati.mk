################################################################################
#
# gst-plugin-ducati
#
################################################################################

GST_PLUGIN_DUCATI_VERSION = 7f3326b81b838fb6c916acd1d6a3090fda12c772
GST_PLUGIN_DUCATI_SITE = git://git.ti.com/glsdk/gst-plugin-ducati.git
GST_PLUGIN_DUCATI_LICENSE = GPL-2.0
GST_PLUGIN_DUCATI_LICENSE_FILES = GPL-COPYING

GST_PLUGIN_DUCATI_INSTALL_STAGING = YES

GST_PLUGIN_DUCATI_DEPENDENCIES = gstreamer1 gst1-plugins-good gst1-plugins-base gst1-plugins-bad libdce

GST_PLUGIN_DUCATI_MAKE_OPTS = \
        CFLAGS="$(TARGET_CFLAGS) -w"

define GST_PLUGIN_DUCATI_RUN_AUTOGEN
	cd $(@D); $(TARGET_CONFIGURE_ARGS) $(TARGET_CONFIGURE_OPTS) ./autogen.sh --host=arm-linux-gnueabihf
endef

GST_PLUGIN_DUCATI_PRE_CONFIGURE_HOOKS += GST_PLUGIN_DUCATI_RUN_AUTOGEN

$(eval $(autotools-package))


