################################################################################
#
# poppler
#
################################################################################

POPPLER_DATA_VERSION = 0.4.8
POPPLER_DATA_SOURCE = poppler-data-$(POPPLER_DATA_VERSION).tar.gz
POPPLER_DATA_SITE = http://poppler.freedesktop.org
POPPLER_DATA_DEPENDENCIES = fontconfig host-pkgconf
POPPLER_DATA_LICENSE = GPL-2.0+
POPPLER_DATA_LICENSE_FILES = COPYING
POPPLER_DATA_INSTALL_STAGING = YES


$(eval $(cmake-package))

