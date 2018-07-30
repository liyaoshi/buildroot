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

$(eval $(autotools-package))

