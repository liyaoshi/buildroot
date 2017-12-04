################################################################################
#
# qpdfview
#
################################################################################

QPDFVIEW_VERSION = 8518b4e7654776984294e95c4a5b14f2c6c0867d
QPDFVIEW_SITE = $(call github,bendikro,qpdfview,$(QPDFVIEW_VERSION))
QPDFVIEW_DEPENDENCIES = qt5base  poppler qt5svg
QPDFVIEW_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
QPDFVIEW_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL

define QPDFVIEW_CONFIGURE_CMDS
        (cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake CONFIG+="without_cups without_ps without_djvu"  qpdfview.pro)
endef

define QPDFVIEW_BUILD_CMDS
	 $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(MAKE) -C $(@D) 
endef

define QPDFVIEW_INSTALL_TARGET_CMDS
	cp -arf  $(@D)/qpdfview $(TARGET_DIR)/usr/bin
	cp -arf  $(@D)/libqpdfview_pdf.so $(TARGET_DIR)/usr/lib
endef


$(eval $(generic-package))
