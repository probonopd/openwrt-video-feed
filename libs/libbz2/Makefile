include $(TOPDIR)/rules.mk

PKG_NAME:=libbz2
PKG_VERSION:=1.0.8
PKG_RELEASE:=1

PKG_SOURCE:=bzip2-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://sourceware.org/pub/bzip2/
PKG_HASH:=ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269

PKG_MAINTAINER:=
PKG_LICENSE:=bzip2-1.0.6
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR:=$(BUILD_DIR)/bzip2-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libbz2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=bzip2 compression library
  URL:=https://sourceware.org/bzip2/
endef

define Package/libbz2/description
  bzip2 is a freely available, patent free, high-quality data compressor.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -fpic" \
		AR="$(TARGET_AR)" \
		RANLIB="$(TARGET_RANLIB)" \
		libbz2.a bzip2 bzip2recover
	$(TARGET_CC) $(TARGET_CFLAGS) -shared -Wl,-soname,libbz2.so.1 \
		-o $(PKG_BUILD_DIR)/libbz2.so.$(PKG_VERSION) \
		$(PKG_BUILD_DIR)/blocksort.o \
		$(PKG_BUILD_DIR)/huffman.o \
		$(PKG_BUILD_DIR)/crctable.o \
		$(PKG_BUILD_DIR)/randtable.o \
		$(PKG_BUILD_DIR)/compress.o \
		$(PKG_BUILD_DIR)/decompress.o \
		$(PKG_BUILD_DIR)/bzlib.o
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/bzlib.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libbz2.a $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/libbz2.so.$(PKG_VERSION) $(1)/usr/lib/
	$(LN) libbz2.so.$(PKG_VERSION) $(1)/usr/lib/libbz2.so.1
	$(LN) libbz2.so.1 $(1)/usr/lib/libbz2.so
endef

define Package/libbz2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libbz2.so.$(PKG_VERSION) $(1)/usr/lib/
	$(LN) libbz2.so.$(PKG_VERSION) $(1)/usr/lib/libbz2.so.1
endef

$(eval $(call BuildPackage,libbz2))
