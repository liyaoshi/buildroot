################################################################################
#
# weston
#
################################################################################

WESTON_VERSION = 1.6.0
WESTON_SITE = http://wayland.freedesktop.org/releases
WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
WESTON_LICENSE = MIT
WESTON_LICENSE_FILES = COPYING

WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
	jpeg mtdev udev cairo libinput

WESTON_CONF_OPTS = \
	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
	--disable-xwayland \
	--disable-x11-compositor \
	--disable-drm-compositor \
	--disable-headless-compositor \
	--disable-weston-launch \
	--with-cairo=glesv2 \
	--with-cairo-glesv2 \
	--disable-colord

ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
WESTON_DEPENDENCIES += libunwind
else
WESTON_CONF_OPTS += --disable-libunwind
endif

ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
WESTON_DEPENDENCIES += freerdp
WESTON_CONF_OPTS += --enable-rdp-compositor
else
WESTON_CONF_OPTS += --disable-rdp-compositor
endif

ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
WESTON_CONF_OPTS += --enable-fbdev-compositor
else
WESTON_CONF_OPTS += --disable-fbdev-compositor
endif

ifeq ($(BR2_PACKAGE_WESTON_RPI),y)
WESTON_DEPENDENCIES += rpi-userland
WESTON_CONF_OPTS += --enable-rpi-compositor \
	--disable-resize-optimization \
	--disable-setuid-install \
	--disable-xwayland-test \
	--disable-simple-egl-clients \
	WESTON_NATIVE_BACKEND=rpi-backend.so
else
WESTON_CONF_OPTS += --disable-rpi-compositor \
	EGL_CFLAGS=" -DLINUX=1 -DEGL_API_FB -DEGL_API_WL" \
	SIMPLE_EGL_CLIENT_CFLAGS=" -DLINUX=1 -DEGL_API_FB -DEGL_API_WL" \
	CLIENT_CFLAGS=" -DLINUX=1 -DEGL_API_FB -DEGL_API_WL" \
	EGL_TESTS_CFLAGS=" -DLINUX=1 -DEGL_API_FB -DEGL_API_WL" \
	EGL_LIBS="-lGAL -lEGL -lGLESv2 " \
	EGL_TESTS_LIBS="-lGAL -lEGL -lGLESv2 " \
           WESTON_NATIVE_BACKEND="fbdev-backend.so"

endif # BR2_PACKAGE_WESTON_RPI


$(eval $(autotools-package))
