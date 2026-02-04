include $(TOPDIR)/rules.mk

PKG_NAME:=xf86-input-evdev
PKG_VERSION:=2.10.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/driver/
PKG_HASH:=8726073e81861bc7b2321e76272cbdbd33c7e1a121535a9827977265b9033ec0

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

# Note: This driver builds against XLibre ABI, not Xorg ABI.
PKG_BUILD_DEPENDS:=xlibre xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/xf86-input-evdev
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X.Org evdev input driver
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+xlibre +libevdev +libudev-zero +libmtdev
endef

define Package/xf86-input-evdev/description
  Generic Linux input driver for X.Org using evdev.
endef

CONFIGURE_ARGS += \
	--with-xorg-module-dir=/usr/lib/xorg/modules

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/xf86-input-evdev/install
	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules/input
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/xorg/modules/input/*.so $(1)/usr/lib/xorg/modules/input/
	$(INSTALL_DIR) $(1)/usr/share/X11/xorg.conf.d
	$(CP) $(PKG_INSTALL_DIR)/usr/share/X11/xorg.conf.d/*.conf $(1)/usr/share/X11/xorg.conf.d/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,xf86-input-evdev))
