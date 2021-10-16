################################################################################
#
# libfoo
#
################################################################################

LIBMARISA_VERSION = v0.2.6 
#LIBMARISA_SOURCE= $(LIBMARISA_VERSION).tar.gz
LIBMARISA_SITE = git://github.com/s-yata/marisa-trie.git
LIBMARISA_INSTALL_STAGING = YES
LIBMARISA_INSTALL_TARGET = YES
LIBMARISA_CONF_ENV = 
LIBMARISA_CONF_OPTS = 
LIBMARISA_DEPENDENCIES = 
LIBMARISA_AUTORECONF = YES

$(eval $(autotools-package))
