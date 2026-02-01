include $(TOPDIR)/rules.mk

PKG_NAME:=libxft
PKG_VERSION:=2.3.8
PKG_RELEASE:=1

PKG_SOURCE:=libXft-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=5e8c3c4bc2d4c0a40aef6b4b38ed2fb74301640da29f6528154b5009b1c6dd49

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libXft-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/libxft
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X FreeType library
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+libx11 +libxrender +libfreetype +fontconfig
endef

define Package/libxft/description
  X FreeType library - client-side font rendering.
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/X11/Xft
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/Xft/*.h $(1)/usr/include/X11/Xft/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.a $(1)/usr/lib/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libxft/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libxft))
