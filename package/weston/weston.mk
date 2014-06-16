################################################################################
#
# weston
#
################################################################################

WESTON_VERSION = 1.5.0
WESTON_SITE = http://wayland.freedesktop.org/releases/
WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
WESTON_LICENSE = MIT
WESTON_LICENSE_FILES = COPYING

WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
	jpeg mtdev udev cairo

# We're touching Makefile.am
WESTON_AUTORECONF = YES

WESTON_CONF_OPT = \
	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
	--disable-xwayland \
	--disable-x11-compositor \
	--disable-drm-compositor \
	--disable-wayland-compositor \
	--disable-headless-compositor \
	--disable-weston-launch \
	--disable-colord \
	--disable-libunwind

ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
WESTON_CONF_OPT += --enable-fbdev-compositor \
           COMPOSITOR_CFLAGS="-I$${STAGING_DIR}/usr/include/pixman-1 -I$${STAGING_DIR}/usr/include/cairo -DLINUX=1 -DEGL_API_FB -DEGL_API_WL" \
           COMPOSITOR_LIBS="-lGLESv2 -lEGL -lGAL -lwayland-server -lxkbcommon -lpixman-1"  \
	   FB_COMPOSITOR_CFLAGS="-DLINUX -DEGL_API_FB -DEGL_API_WL" \
	   FB_COMPOSITOR_LIBS="-lGLESv2 -lEGL -lwayland-server -lxkbcommon" \
           LDFLAGS="-lwayland-server  -lEGL  -lwayland-cursor -lpixman-1"  \
           CLIENT_CFLAGS="-I$${STAGING_DIR}/usr/include/pixman-1 -I$${STAGING_DIR}/usr/include/cairo -DLINUX=1 -DEGL_API_FB -DEGL_API_WL "  \
           CLIENT_LIBS="-lGLESv2 -lEGL -lwayland-client -lEGL -lwayland-cursor -lxkbcommon -lcairo" \
           SIMPLE_EGL_CLIENT_CFLAGS="-I$${STAGING_DIR}/usr/include/pixman-1 -I$${STAGING_DIR}/usr/include/cairo -DLINUX=1 -DEGL_API_FB -DEGL_API_WL " \
           SIMPLE_EGL_CLIENT_LIBS="-lGLESv2 -lEGL -lwayland-client -lwayland-cursor -lcairo" \
	   SIMPLE_CLIENT_LIBS="-lGLESv2 -lEGL  -lwayland-client -lwayland-cursor -lcairo" \
           IMAGE_LIBS="-lwayland-cursor -lcario" \
           WESTON_INFO_LIBS="-lwayland-client" \
           WESTON_NATIVE_BACKEND="fbdev-backend.so"
else
WESTON_CONF_OPT += --disable-fbdev-compositor
endif

ifeq ($(BR2_PACKAGE_WESTON_RPI),y)
WESTON_DEPENDENCIES += rpi-userland
WESTON_CONF_OPT += --enable-rpi-compositor \
	--disable-resize-optimization \
	--disable-setuid-install \
	--disable-xwayland-test \
	--disable-simple-egl-clients \
	WESTON_NATIVE_BACKEND=rpi-backend.so
else
WESTON_CONF_OPT += --disable-rpi-compositor
endif # BR2_PACKAGE_WESTON_RPI

$(eval $(autotools-package))
