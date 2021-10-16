################################################################################
#
# libfoo
#
################################################################################

KYOTOCABINET_VERSION = 1.2.78
KYOTOCABINET_SOURCE= kyotocabinet-$(KYOTOCABINET_VERSION).tar.gz
KYOTOCABINET_SITE = https://dbmx.net/kyotocabinet/pkg
KYOTOCABINET_INSTALL_STAGING = YES
KYOTOCABINET_INSTALL_TARGET = YES
KYOTOCABINET_CONF_ENV = 
KYOTOCABINET_CONF_OPTS = 
KYOTOCABINET_LIBTOOL_PATCH = YES
KYOTOCABINET_DEPENDENCIES = zlib
KYOTOCABINET_AUTORECONF = YES

define KYOTOCABINET_POST_CONFIGURE_FIXUP
    echo "======================================="
    patch -d $(@D) < package/kyotocabinet/Makefile.p
endef

KYOTOCABINET_POST_CONFIGURE_HOOKS += KYOTOCABINET_POST_CONFIGURE_FIXUP

$(eval $(autotools-package))
