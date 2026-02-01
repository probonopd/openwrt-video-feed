include $(TOPDIR)/rules.mk

PKG_NAME:=libpng
PKG_VERSION:=1.6.44
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@SF/libpng
PKG_HASH:=60c4da1d5b7f0aa8d158da48e8f8afa9773c1c8baa5d21974df61f1886b8ce8e

PKG_MAINTAINER:=
PKG_LICENSE:=libpng-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/libpng
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=PNG image format library
  URL:=http://www.libpng.org/
  DEPENDS:=+zlib
endef

define Package/libpng/description
  The PNG reference library for reading, displaying, writing
  and examining png Image Network Graphics.
endef

CONFIGURE_ARGS += \
	--disable-static

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpng*.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/libpng*-config $(1)/usr/bin/ 2>/dev/null || true
endef

define Package/libpng/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpng*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libpng))
