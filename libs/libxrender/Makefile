include $(TOPDIR)/rules.mk

PKG_NAME:=libxrender
PKG_VERSION:=0.9.12
PKG_RELEASE:=1

PKG_SOURCE:=libXrender-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=b832128da48b39c8d608224481743403ad1691bf4e554e4be9c174df171d1b97

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libXrender-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/libxrender
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X Render Extension client library
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+libx11
endef

define Package/libxrender/description
  X Rendering Extension client library.
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/X11/extensions
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/extensions/*.h $(1)/usr/include/X11/extensions/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.a $(1)/usr/lib/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libxrender/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libxrender))
