################################################################################
#
# libfoo
#
################################################################################

LIBVALHALLA_VERSION = 3.0.9
#LIBVALHALLA_SOURCE= $(LIBVALHALLA_VERSION).tar.gz
LIBVALHALLA_SITE = git://github.com/valhalla/valhalla.git
LIBVALHALLA_INSTALL_STAGING = YES
LIBVALHALLA_INSTALL_TARGET = YES
LIBVALHALLA_CONF_OPTS = -DENABLE_DATA_TOOLS=OFF -DENABLE_PYTHON_BINDINGS=OFF -DENABLE_SERVICES=OFF -DENABLE_NODE_BINDINGS=OFF
LIBVALHALLA_DEPENDENCIES = libcurl protobuf-c protobuf boost nodejs
LIBVALHALLA_SUPPORTS_IN_SOURCE_BUILD = NO
LIBVALHALLA_GIT_SUBMODULES=YES

$(eval $(cmake-package))
