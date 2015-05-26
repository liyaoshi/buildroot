################################################################################
#
# kobs-ng
#
################################################################################

# kobs-ng versions have never made much sense :(
<<<<<<< HEAD
KOBS_NG_VERSION = 3.10.17-1.0.0
KOBS_NG_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
KOBS_NG_SOURCE = imx-kobs-3.10.17-1.0.0.tar.gz
=======
KOBS_NG_VERSION = 3.0.35-4.0.0
KOBS_NG_SITE = http://repository.timesys.com/buildsources/k/kobs-ng/kobs-ng-$(KOBS_NG_VERSION)
>>>>>>> remotes/buildroot/master
KOBS_NG_LICENSE = GPLv2+
KOBS_NG_LICENSE_FILES = COPYING

$(eval $(autotools-package))
