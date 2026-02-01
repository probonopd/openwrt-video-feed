include $(TOPDIR)/rules.mk

PKG_NAME:=xkbcomp
PKG_VERSION:=1.4.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/app/
PKG_HASH:=00cecc490fcbe2f789cf13c408c459673c2c33ab758d802677571b7a11a48fbe

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
