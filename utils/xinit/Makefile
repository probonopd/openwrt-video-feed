include $(TOPDIR)/rules.mk

PKG_NAME:=xinit
PKG_VERSION:=1.4.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/app/
PKG_HASH:=b7d8dc8d22ef9f15985a10b606ee4f2aad6828befa437359934647e88d331f23

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/xinit
  SECTION:=utils
  CATEGORY:=Video
  SUBMENU:=Utilities
  TITLE:=X Window System initializer
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+libx11 +xauth +xlibre
endef

define Package/xinit/description
  Programs xinit and startx to start the X Window System.
endef

CONFIGURE_ARGS += \
	--with-xinitdir=/etc/X11/xinit

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/xinit/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/xinit $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/startx $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/X11/xinit
	$(CP) $(PKG_INSTALL_DIR)/etc/X11/xinit/* $(1)/etc/X11/xinit/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,xinit))
