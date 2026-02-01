include $(TOPDIR)/rules.mk

PKG_NAME:=xkbcomp
PKG_VERSION:=1.4.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/app/
PKG_HASH:=0a288114e5f44e31987042c79aecff1ffad53a8154b8ec971c24a69a80f81f77

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/xkbcomp
  SECTION:=utils
  CATEGORY:=Video
  SUBMENU:=Utilities
  TITLE:=XKB keyboard description compiler
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+libx11 +libxkbfile
endef

define Package/xkbcomp/description
  X Keyboard (XKB) Extension compiler.
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/xkbcomp/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/xkbcomp $(1)/usr/bin/
endef

$(eval $(call BuildPackage,xkbcomp))
