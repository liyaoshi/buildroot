################################################################################
#
#ipcdev from ti
#
################################################################################

LIBDCE_VERSION = f72096090e3063e85ea77cae66b2d99a48d91727
LIBDCE_SITE =  git://git.omapzoom.org/repo/libdce.git
LIBDCE_LICENSE = GPL-2.0
LIBDCE_LICENSE_FILES = GPL-COPYING
LIBDCE_INSTALL_STAGING = YES

LIBDCE_DEPENDENCIES = ipcdev

#EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
define LIBDCE_RUN_AUTOGEN
        cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef

# define LIBDCE_RUN_FIXMAKE
#       $(SED) 's/\-O3/\-O0/' $(@D)/Makefile
# endef

# LIBDCE_PRE_BUILD_HOOKS += LIBGBM_RUN_FIXMAKE
LIBDCE_PRE_CONFIGURE_HOOKS += LIBGBM_RUN_AUTOGEN


$(eval $(autotools-package))
