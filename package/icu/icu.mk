################################################################################
#
# icu custom size from http://apps.icu-project.org/datacustom/ICUData51.html
#
################################################################################

ICU_VERSION = 55.1
ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
ICU_LICENSE = ICU License
ICU_LICENSE_FILES = license.html

ICU_DEPENDENCIES = host-icu
ICU_INSTALL_STAGING = YES
ICU_CONFIG_SCRIPTS = icu-config
ICU_CONF_OPTS = \
	--with-cross-build=$(HOST_ICU_DIR)/source \
	--disable-samples \
	--disable-tests
HOST_ICU_CONF_OPTS = \
	--disable-samples \
	--disable-tests \
	--disable-extras \
	--disable-icuio \
	--disable-layout \
	--disable-renaming
ICU_MAKE = $(MAKE1)
ICU_SUBDIR = source
HOST_ICU_SUBDIR = source

<<<<<<< HEAD
define ICU_RELEAE_DATA_FILES
	cp -f package/icu/icudt51l.dat $(ICU_DIR)/source/data/in
endef

ICU_POST_EXTRACT_HOOKS += ICU_RELEAE_DATA_FILES
=======
ICU_CUSTOM_DATA_PATH = $(call qstrip,$(BR2_PACKAGE_ICU_CUSTOM_DATA_PATH))

ifneq ($(ICU_CUSTOM_DATA_PATH),)
define ICU_COPY_CUSTOM_DATA
	cp $(ICU_CUSTOM_DATA_PATH) $(@D)/source/data/in/
endef
ICU_POST_PATCH_HOOKS += ICU_COPY_CUSTOM_DATA
endif
>>>>>>> remotes/buildroot/master

$(eval $(autotools-package))
$(eval $(host-autotools-package))
