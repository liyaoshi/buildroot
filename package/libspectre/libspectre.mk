################################################################################
#
# libspectre
#
################################################################################

# This correpsonds to SDK 02.00.00.00
LIBSPECTRE_VERSION = f88d2c259242936bbc3c74bf43107626c0f5ad61
LIBSPECTRE_SITE =  git://anongit.freedesktop.org/git/libspectre 
LIBSPECTRE_LICENSE = GPL-2.0
LIBSPECTRE_LICENSE_FILES = GPL-COPYING 

LIBSPECTRE_INSTALL_TARGET = YES
LIBSPECTRE_INSTALL_STAGING = YES

define LIBSPECTRE_RUN_AUTOGEN
        cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
LIBSPECTRE_PRE_CONFIGURE_HOOKS += LIBSPECTRE_RUN_AUTOGEN
$(eval $(autotools-package))
