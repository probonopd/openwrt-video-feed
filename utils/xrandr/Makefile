include $(TOPDIR)/rules.mk

PKG_NAME:=xrandr
PKG_VERSION:=1.5.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/app/
PKG_HASH:=c8bee4790d9058bacc4b6246456c58021db58a87ddda1a9d0139bf5f18f1f240

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/xrandr
  SECTION:=utils
  CATEGORY:=Video
  SUBMENU:=Utilities
  TITLE:=X RandR utility
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+libx11 +libxrandr +libxrender
endef

define Package/xrandr/description
  Command-line interface to RandR extension.
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/xrandr/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/xrandr $(1)/usr/bin/
endef

$(eval $(call BuildPackage,xrandr))
