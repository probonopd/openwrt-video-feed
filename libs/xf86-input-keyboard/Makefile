include $(TOPDIR)/rules.mk

PKG_NAME:=xf86-input-keyboard
PKG_VERSION:=2.1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/driver/
PKG_HASH:=77ce50f28c30347c6eb59169c12c19b639d73f10e49284b2849f023c6dee7c57

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=xlibre xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/xf86-input-keyboard
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X.Org keyboard input driver
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+xlibre
endef

define Package/xf86-input-keyboard/description
  Generic keyboard input driver for X.Org.
endef

CONFIGURE_ARGS += \
	--with-xorg-module-dir=/usr/lib/xorg/modules

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/xf86-input-keyboard/install
	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules/input
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/xorg/modules/input/*.so $(1)/usr/lib/xorg/modules/input/
endef

$(eval $(call BuildPackage,xf86-input-keyboard))
