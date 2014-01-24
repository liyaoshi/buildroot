QTWAYLAND_VERSION = 15f82d0bc40eae635ed1377ae39253a8f515ea4a
QTWAYLAND_SITE = git://gitorious.org/qt/qtwayland.git
QTWAYLAND_SITE_METHOD = git


QTWAYLAND_LICENSE = GPLv2
QTWAYLAND_LICENSE_FILES = COPYING


define QTWAYLAND_CONFIGURE_CMDS
        (cd $(@D); $(HOST_DIR)/usr/bin/qmake)
endef

define QTWAYLAND_BUILD_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QTWAYLAND_INSTALL_STAGING_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
        $(QT5_LA_PRL_FILES_FIXUP) 
endef

define QTWAYLAND_INSTALL_TARGET_CMDS
	cd $(@D); \
	cp -dpfr plugins/platforms/libqwayland-egl.so $(TARGET_DIR)/usr/lib/qt/plugins/platforms
endef

$(eval $(generic-package))
