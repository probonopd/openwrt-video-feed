include $(TOPDIR)/rules.mk

PKG_NAME:=xterm
PKG_VERSION:=397
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://invisible-mirror.net/archives/xterm/
PKG_HASH:=97c24ea9b8a8dc474df04ae3e57dee5eca4a2bc00ffebb6c9ee8c48c25f25cbf

PKG_MAINTAINER:=Daniel Golle <daniel@makrotopia.org>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/xterm
  SECTION:=utils
  CATEGORY:=Video
  SUBMENU:=Utilities
  TITLE:=X terminal emulator
  URL:=https://invisible-island.net/xterm/
  DEPENDS:=+libx11 +libxft +libxaw +libxmu +libxt +libxext +libxinerama \
	+ncurses +xlibre
endef

define Package/xterm/description
  xterm is the standard terminal emulator for the X Window System.
endef

CONFIGURE_ARGS += \
	--disable-imake \
	--disable-desktop \
	--with-app-defaults=/usr/share/X11/app-defaults \
	--with-utempter=no

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/xterm/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/xterm $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/resize $(1)/usr/bin/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/share/X11/app-defaults
	$(CP) $(PKG_INSTALL_DIR)/usr/share/X11/app-defaults/* $(1)/usr/share/X11/app-defaults/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,xterm))
