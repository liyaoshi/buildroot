################################################################################
#
# qupzilla
#
################################################################################

QUPZILLA_VERSION = 0cd15adc38a5ff01bb4e1a9dd62067827b8f9e4a
QUPZILLA_SITE = $(call github,QupZilla,qupzilla,$(QUPZILLA_VERSION))
QUPZILLA_DEPENDENCIES = qt5webengine
QUPZILLA_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
QUPZILLA_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL

define QUPZILLA_CONFIGURE_CMDS
        (cd $(@D);   NO_X11=true  $(TARGET_MAKE_ENV)  $(HOST_DIR)/bin/qmake  QupZilla.pro)
endef

define QUPZILLA_BUILD_CMDS
	 $(TARGET_MAKE_ENV) NO_X11=true $(QT5WEBENGINE_ENV) $(MAKE1) -C $(@D) 
endef

define QUPZILLA_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/qupzilla/
	cp -arf $(@D)/bin/libQupZilla.so* $(TARGET_DIR)/usr/lib/
	cp -arf $(@D)/bin/qupzilla $(TARGET_DIR)/usr/bin
	cp -arf $(@D)/bin/themes $(TARGET_DIR)/usr/share/qupzilla/ 
	cp -arf $(@D)/bin/plugins $(TARGET_DIR)/usr/share/qupzilla/ 
	cp -arf $(@D)/bin/locale $(TARGET_DIR)/usr/share/qupzilla/ 
endef


$(eval $(generic-package))
