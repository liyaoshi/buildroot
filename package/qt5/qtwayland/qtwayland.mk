QTWAYLAND_VERSION = 6d038fb664de833725d13ee6b548d85eabf1ff3a
QTWAYLAND_SITE = git://gitorious.org/qt/qtwayland.git
QTWAYLAND_SITE_METHOD = git

QTWAYLAND_DEPENDENCIES = wayland weston

QTWAYLAND_LICENSE = GPLv2
QTWAYLAND_LICENSE_FILES = COPYING


define QTWAYLAND_CONFIGURE_CMDS
        (cd $(@D); \
	mkdir -p  $(@D)/include/QtWaylandClient/5.2.1/QtWaylandClient/private/ ;\
	cd  include/QtWaylandClient/5.2.1/QtWaylandClient/private/ ;\
	ln -s ../../../../../src/client/hardwareintegration/*.h . ; \
	ln -s ../../../../../src/client/*.h . ;\
	cd $(@D);	\
	PATH=$(HOST_DIR)/usr/bin:$(PATH) $(HOST_DIR)/usr/bin/qmake \
	)
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
	cp -arf lib/libQt5WaylandClient.so* $(TARGET_DIR)/usr/lib/ ;\
	cp -dpfr plugins/platforms/libqwayland-egl.so $(TARGET_DIR)/usr/lib/qt/plugins/platforms
endef

$(eval $(generic-package))
