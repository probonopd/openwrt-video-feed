include $(TOPDIR)/rules.mk

PKG_NAME:=xorg-macros
PKG_VERSION:=1.20.1
PKG_RELEASE:=1

PKG_SOURCE:=util-macros-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/util/
PKG_HASH:=0b308f62dce78ac0f4d9de6888234bf168b0ca1d3d3ae11a87852a49e2e009eb

PKG_MAINTAINER:=Daniel Golle <daniel@makrotopia.org>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/util-macros-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/xorg-macros
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X.Org autoconf macros
  URL:=https://xorg.freedesktop.org/
  BUILDONLY:=1
endef

define Package/xorg-macros/description
  X.Org autoconf utility macros.
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/share/aclocal
	$(CP) $(PKG_INSTALL_DIR)/usr/share/aclocal/*.m4 $(1)/usr/share/aclocal/
	$(INSTALL_DIR) $(1)/usr/share/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/share/pkgconfig/*.pc $(1)/usr/share/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/share/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

$(eval $(call BuildPackage,xorg-macros))
