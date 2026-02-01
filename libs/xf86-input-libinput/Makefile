include $(TOPDIR)/rules.mk

PKG_NAME:=xf86-input-libinput
PKG_VERSION:=1.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/driver/
PKG_HASH:=2524c35f196554ea11aef3bba1cf324759454e1d49f98ac026ace2f6003580e6

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=xlibre xorgproto

include $(INCLUDE_DIR)/package.mk

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

CONFIGURE_ARGS += \
	--with-xorg-module-dir=/usr/lib/xorg/modules

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/xf86-input-libinput/install
	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules/input
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/xorg/modules/input/*.so $(1)/usr/lib/xorg/modules/input/
	$(INSTALL_DIR) $(1)/usr/share/X11/xorg.conf.d
	$(CP) $(PKG_INSTALL_DIR)/usr/share/X11/xorg.conf.d/*.conf $(1)/usr/share/X11/xorg.conf.d/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,xf86-input-libinput))
