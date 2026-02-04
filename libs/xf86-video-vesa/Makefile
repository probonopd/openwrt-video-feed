include $(TOPDIR)/rules.mk

PKG_NAME:=xf86-video-vesa
PKG_VERSION:=2.6.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/driver/
PKG_HASH:=10082771b1a8f659c60b3d9b70456a4b59948a75b3cade2dfa33b8b05e549bb1

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

# Note: This driver builds against XLibre ABI, not Xorg ABI.
PKG_BUILD_DEPENDS:=xlibre xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/xf86-video-vesa
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X.Org vesa video driver
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+xlibre @(TARGET_x86||TARGET_x86_64)
endef

define Package/xf86-video-vesa/description
  Generic VESA video driver for X.Org (x86/x86_64 only).
endef

CONFIGURE_ARGS += \
	--with-xorg-module-dir=/usr/lib/xorg/modules

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/xf86-video-vesa/install
	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules/drivers
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/xorg/modules/drivers/*.so $(1)/usr/lib/xorg/modules/drivers/
endef

$(eval $(call BuildPackage,xf86-video-vesa))
