include $(TOPDIR)/rules.mk

PKG_NAME:=xf86-input-libinput
PKG_VERSION:=1.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/driver/
PKG_HASH:=a3d948f9a8fbf11c2f2c60377a5f68406f0f7e3c34afc7d5aa4c9e1f12385eb8

PKG_MAINTAINER:=Daniel Golle <daniel@makrotopia.org>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=xlibre xorgproto

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/xf86-input-libinput
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X.Org libinput input driver
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+xlibre +libinput
endef

define Package/xf86-input-libinput/description
  Generic Linux input driver for X.Org using libinput.
endef

MESON_ARGS += \
	-Dxorg-module-dir=/usr/lib/xorg/modules

define Package/xf86-input-libinput/install
	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules/input
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/xorg/modules/input/*.so $(1)/usr/lib/xorg/modules/input/
	$(INSTALL_DIR) $(1)/usr/share/X11/xorg.conf.d
	$(CP) $(PKG_INSTALL_DIR)/usr/share/X11/xorg.conf.d/*.conf $(1)/usr/share/X11/xorg.conf.d/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,xf86-input-libinput))
