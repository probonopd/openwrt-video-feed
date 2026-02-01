include $(TOPDIR)/rules.mk

PKG_NAME:=xauth
PKG_VERSION:=1.1.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/app/
PKG_HASH:=88c288e4a5eb7844f88a7702aa049082b783152d9e5e49186f62c2f6139eb53e

PKG_MAINTAINER:=Daniel Golle <daniel@makrotopia.org>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/xauth
  SECTION:=utils
  CATEGORY:=Video
  SUBMENU:=Utilities
  TITLE:=X authority file utility
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+libx11 +libxau +libxext +libxmuu
endef

define Package/xauth/description
  X authority file utility for X server authentication.
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/xauth/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/xauth $(1)/usr/bin/
endef

$(eval $(call BuildPackage,xauth))
