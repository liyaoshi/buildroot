################################################################################
#
# qt5websockets
#
################################################################################

QT5WEBSOCKETS_VERSION = $(QT5_VERSION)
QT5WEBSOCKETS_SITE = $(QT5_SITE)
QT5WEBSOCKETS_SOURCE = qtwebsockets-opensource-src-$(QT5WEBSOCKETS_VERSION).tar.xz
QT5WEBSOCKETS_DEPENDENCIES = qt5base
QT5WEBSOCKETS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
<<<<<<< HEAD
QT5WEBSOCKETS_LICENSE = LGPLv2.1
QT5WEBSOCKETS_LICENSE_FILES = LICENSE
=======
QT5WEBSOCKETS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
# Source files contain references to LGPL_EXCEPTION.txt but it is not included
# in the archive.
QT5WEBSOCKETS_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2
>>>>>>> remotes/buildroot/master
else
QT5WEBSOCKETS_LICENSE = Commercial license
QT5WEBSOCKETS_REDISTRIBUTE = NO
endif

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
QT5WEBSOCKETS_DEPENDENCIES += qt5declarative
endif

define QT5WEBSOCKETS_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
endef

define QT5WEBSOCKETS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QT5WEBSOCKETS_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
	$(QT5_LA_PRL_FILES_FIXUP)
endef

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
define QT5WEBSOCKETS_INSTALL_TARGET_QMLS
	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/WebSockets $(TARGET_DIR)/usr/qml/Qt/
endef
endif

ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
define QT5WEBSOCKETS_INSTALL_TARGET_EXAMPLES
	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/websockets $(TARGET_DIR)/usr/lib/qt/examples/
endef
endif

<<<<<<< HEAD
ifneq ($(BR2_PREFER_STATIC_LIB),y)
=======
ifneq ($(BR2_STATIC_LIBS),y)
>>>>>>> remotes/buildroot/master
define QT5WEBSOCKETS_INSTALL_TARGET_LIBS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebSockets.so.* $(TARGET_DIR)/usr/lib
endef
endif

define QT5WEBSOCKETS_INSTALL_TARGET_CMDS
	$(QT5WEBSOCKETS_INSTALL_TARGET_LIBS)
	$(QT5WEBSOCKETS_INSTALL_TARGET_QMLS)
endef

$(eval $(generic-package))
