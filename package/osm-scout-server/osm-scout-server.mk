################################################################################
#
# libfoo
#
################################################################################

OSM_SCOUT_SERVER_VERSION = 1.17.0
OSM_SCOUT_SERVER_SITE = git://github.com/rinigus/osmscout-server.git
OSM_SCOUT_SERVER_INSTALL_STAGING = YES
OSM_SCOUT_SERVER_INSTALL_TARGET = YES
OSM_SCOUT_SERVER_CONF_ENV = SCOUT_FLAVOR=cli
OSM_SCOUT_SERVER_CONF_OPTS = 
OSM_SCOUT_SERVER_BUILD_OPTS = -lboost_filesystem -lboost_system
OSM_SCOUT_SERVER_DEPENDENCIES = libvalhalla libosmscout libmarisa kyotocabinet libpostal qt5location libmicrohttpd boost
OSM_SCOUT_SERVER_GIT_SUBMODULES=YES

define OSM_SCOUT_SERVER_POST_CONFIGURE_FIXUP
    echo "======================================="
    patch -d $(@D) < package/osm-scout-server/fix-cross-compile.p
    env
endef

OSM_SCOUT_SERVER_POST_CONFIGURE_HOOKS += OSM_SCOUT_SERVER_POST_CONFIGURE_FIXUP

$(eval $(qmake-package))

define OSM_SCOUT_SERVER_INSTALL_STAGING_CMDS
    $(INSTALL) -D -m 0755 $(@D)/osmscout-server $(STAGING_DIR)/usr/bin/osmscout-server
    $(INSTALL) -d -D -m 0755 $(@D)/styles $(STAGING_DIR)/usr/share/osmscout-server
    $(INSTALL) -d -D -m 0755 $(@D)/data $(STAGING_DIR)/usr/share/osmscout-server
endef

define OSM_SCOUT_SERVER_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/osmscout-server $(TARGET_DIR)/usr/bin/osmscout-server
    $(INSTALL) -d -D -m 0755 $(@D)/styles $(TARGET_DIR)/usr/share/osmscout-server
    $(INSTALL) -d -D -m 0755 $(@D)/data $(TARGET_DIR)/usr/share/osmscout-server
endef
