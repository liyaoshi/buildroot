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
POPPLER_DEPENDENCIES =  poppler-data qt5base host-cmake  openjpeg libnss

POPPLER_CONF_OPTS +=  -DENABLE_QT4=OFF -DENABLE_GLIB=OFF \
	-DENABLE_NSS3=ON
ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
POPPLER_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
endif

ifeq ($(BR2_PACKAGE_CAIRO),y)
POPPLER_CONF_OPTS += --enable-cairo-output
POPPLER_DEPENDENCIES += cairo
else
POPPLER_CONF_OPTS += --disable-cairo-output
endif

$(eval $(cmake-package))

