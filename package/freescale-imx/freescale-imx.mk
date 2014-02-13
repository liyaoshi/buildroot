################################################################################
#
# freescale-imx
#
################################################################################

FREESCALE_IMX_VERSION = 3.10.17-1.0.0_beta

# No official download site from freescale, just this mirror
FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source

include $(sort $(wildcard package/freescale-imx/*/*.mk))
