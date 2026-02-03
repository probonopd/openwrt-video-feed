include $(TOPDIR)/rules.mk

PKG_NAME:=zlib
PKG_VERSION:=1.3.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://zlib.net/
PKG_HASH:=38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32

PKG_MAINTAINER:=
PKG_LICENSE:=Zlib
PKG_LICENSE_FILES:=README

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/zlib
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=zlib compression library
  URL:=https://zlib.net/
endef

define Package/zlib/description
  zlib is a general purpose data compression library.
endef

CONFIGURE_ARGS:=

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) $(FPIC)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		./configure \
			--prefix=/usr \
			--shared \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libz.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/zlib/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libz.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,zlib))
