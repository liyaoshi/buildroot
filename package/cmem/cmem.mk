################################################################################
#
#ipcdev from ti
#
################################################################################

CMEM_VERSION = b687f3c3658221cdb2731e2421a26004ee7193b8
CMEM_SITE =  git://git.ti.com/ipc/ludev.git
CMEM_LICENSE = GPL-2.0
CMEM_LICENSE_FILES = GPL-COPYING
CMEM_INSTALL_STAGING = YES

CMEM_DEPENDENCIES = linux

define CMEM_BUILD_KO
     cd $(@D) ; make -f lu.mak TOOLCHAIN_PREFIX=$(TARGET_CROSS) KERNEL_INSTALL_DIR=$(LINUX_DIR) module
endef

CMEM_POST_BUILD_HOOKS += CMEM_BUILD_KO

define CMEM_INSTALL_KO
     cp -arvf $(@D)/src/cmem/module/cmemk.ko $(TARGET_DIR)/lib/modules
endef

CMEM_POST_INSTALL_TARGET_HOOKS += CMEM_INSTALL_KO

$(eval $(autotools-package))

