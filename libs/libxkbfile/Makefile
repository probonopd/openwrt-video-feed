include $(TOPDIR)/rules.mk

PKG_NAME:=libxkbfile
PKG_VERSION:=1.1.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=a9b63eea997abb9ee6a8b4fbb515831c841f471af845a09de443b28003874bec

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/libxkbfile
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=XKB file handling library
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+libx11
endef

define Package/libxkbfile/description
  X.Org library for handling XKB description files.
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

define Package/libxkbfile/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libxkbfile))
