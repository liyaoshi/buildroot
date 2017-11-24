################################################################################
#
# libspectre
#
################################################################################

LIBSPECTRE_VERSION = 0.2.7
LIBSPECTRE_SITE =  https://libspectre.freedesktop.org/releases/
LIBSPECTRE_SOURCE =  libspectre-$(LIBSPECTRE_VERSION).tar.gz
LIBSPECTRE_LICENSE = GPL-2.0
LIBSPECTRE_LICENSE_FILES = GPL-COPYING 

LIBSPECTRE_INSTALL_TARGET = YES
LIBSPECTRE_INSTALL_STAGING = YES

$(eval $(autotools-package))
