--- /home/brad/Projects/buildroot/output/build/kyotocabinet-1.2.78/Makefile	2020-09-12 13:21:29.675621609 -0400
+++ package/kyotocabinet/Makefile	2020-09-12 13:09:31.429353608 -0400
@@ -43,20 +43,23 @@
 PCDIR = ${exec_prefix}/lib/pkgconfig
 DESTDIR =
 
+BUILDROOT_INCLUEDIR=$(STAGING_DIR)/usr/include
+BUILDROOT_LIBDIR=$(STAGING_DIR)/usr/lib
+
 # Building configuration
 CC = /home/brad/Projects/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc
 CXX = /home/brad/Projects/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-g++
-CPPFLAGS = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I. -I$(INCLUDEDIR) -I/usr/local/include -DNDEBUG -D_GNU_SOURCE=1 -D_FILE_OFFSET_BITS=64 -D_REENTRANT -D__EXTENSIONS__ -D_MYZLIB -D_MYGCCATOMIC \
-  -D_KC_PREFIX="\"$(prefix)\"" -D_KC_INCLUDEDIR="\"$(INCLUDEDIR)\"" \
-  -D_KC_LIBDIR="\"$(LIBDIR)\"" -D_KC_BINDIR="\"$(BINDIR)\"" -D_KC_LIBEXECDIR="\"$(LIBEXECDIR)\"" \
-  -D_KC_APPINC="\"-I$(INCLUDEDIR)\"" -D_KC_APPLIBS="\"-L$(LIBDIR) -lkyotocabinet -lz -lstdc++ -lrt -lpthread -lm -lc \""
+CPPFLAGS = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I. -I$(BUILDROOT_INCLUDEDIR) -DNDEBUG -D_GNU_SOURCE=1 -D_FILE_OFFSET_BITS=64 -D_REENTRANT -D__EXTENSIONS__ -D_MYZLIB -D_MYGCCATOMIC \
+  -D_KC_PREFIX="\"$(prefix)\"" -D_KC_INCLUDEDIR="\"$(BUILDROOT_INCLUDEDIR)\"" \
+  -D_KC_LIBDIR="\"$(BUILDROOT_LIBDIR)\"" -D_KC_BINDIR="\"$(BINDIR)\"" -D_KC_LIBEXECDIR="\"$(LIBEXECDIR)\"" \
+  -D_KC_APPINC="\"-I$(BUILDROOT_INCLUDEDIR)\"" -D_KC_APPLIBS="\"-L$(BUILDROOT_LIBDIR) -lkyotocabinet -lz -lstdc++ -lrt -lpthread -lm -lc \""
 CFLAGS = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wall -ansi -pedantic -fPIC -fsigned-char -g0 -O2 -Wno-unused-but-set-variable -Wno-unused-but-set-parameter
 CXXFLAGS = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wall -fPIC -fsigned-char -g0 -O2 -Wno-unused-but-set-variable -Wno-unused-but-set-parameter
-LDFLAGS = -L. -L$(LIBDIR) -L/usr/local/lib -Wl,-rpath-link,.:/usr/local/lib:.:/usr/local/lib: -Wl,--as-needed
+LDFLAGS = -L. -L$(BUILDROOT_LIBDIR) -Wl,-rpath-link,.:.: -Wl,--as-needed
 CMDLDFLAGS = 
 CMDLIBS = 
 LIBS = -lz -lstdc++ -lrt -lpthread -lm -lc 
-RUNENV = LD_LIBRARY_PATH=.:/usr/local/lib:
+RUNENV = LD_LIBRARY_PATH=.::
 POSTCMD = true
 
 
