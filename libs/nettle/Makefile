include $(TOPDIR)/rules.mk

PKG_NAME:=nettle
PKG_VERSION:=3.10.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/nettle
PKG_HASH:=b0fcdd7fc0cdea6e80dcf1dd85ba794af0d5b4a57e26397eee3bc193272d9132

PKG_MAINTAINER:=
PKG_LICENSE:=LGPL-3.0-or-later GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING.LESSERv3 COPYINGv2

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libnettle
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=GNU Nettle cryptographic library
  URL:=https://www.lysator.liu.se/~nisse/nettle/
  DEPENDS:=
endef

define Package/libnettle/description
  Nettle is a cryptographic library that is designed to fit easily
  in more or less any context: In crypto toolkits for object-oriented
  languages, in applications like LSH or GNUPG, or even in kernel space.
endef

CONFIGURE_ARGS += \
	--disable-documentation \
	--disable-assembler \
	--enable-mini-gmp

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/nettle
	$(CP) $(PKG_INSTALL_DIR)/usr/include/nettle/*.h $(1)/usr/include/nettle/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.a $(1)/usr/lib/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libnettle/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libnettle))
