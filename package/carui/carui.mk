################################################################################
#
# libfoo
#
################################################################################

CARUI_VERSION = 1.0
CARUI_SITE_METHOD= local
CARUI_SITE = /home/brad/Projects/car_ui
CARUI_INSTALL_STAGING = YES
CARUI_INSTALL_TARGET = YES
CARUI_CONF_OPTS = -DBUILD_DEMOS=ON 
CARUI_DEPENDENCIES = qt5imageformats qt5location qt5quickcontrols qt5base qt5quickcontrols2 libmpdclient

$(eval $(cmake-package))
