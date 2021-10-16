################################################################################
#
# libfoo
#
################################################################################

LIBPOSTAL_VERSION = v1.0.0
#LIBPOSTAL_SOURCE= $(LIBVALHALLA_VERSION).tar.gz
LIBPOSTAL_SITE = git://github.com/openvenues/libpostal.git
LIBPOSTAL_INSTALL_STAGING = YES
LIBPOSTAL_INSTALL_TARGET = YES
LIBPOSTAL_BUILD_OPTS = 
LIBPOSTAL_CONF_OPTS = --disable-sse2 --disable-data-download
LIBPOSTAL_DEPENDENCIES =  
LIBPOSTAL_AUTORECONF = YES

$(eval $(autotools-package))
