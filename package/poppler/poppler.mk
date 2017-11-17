################################################################################
#
# poppler
#
################################################################################

POPPLER_VERSION = 0.61.1
POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
POPPLER_SITE = http://poppler.freedesktop.org
POPPLER_DEPENDENCIES = fontconfig host-pkgconf
POPPLER_LICENSE = GPL-2.0+
POPPLER_LICENSE_FILES = COPYING
POPPLER_INSTALL_STAGING = YES

POPPLER_CONF_OPTS +=  -DENABLE_QT4=OFF -DENABLE_GLIB=OFF \
	-DENABLE_NSS3=ON

$(eval $(cmake-package))

