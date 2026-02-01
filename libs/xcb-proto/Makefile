include $(TOPDIR)/rules.mk

PKG_NAME:=xcb-proto
PKG_VERSION:=1.17.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/proto/
PKG_HASH:=392d3c9690bddd9cebc5139281c222af87887982ed566c839e5fa4aeffaf10f0

PKG_MAINTAINER:=Daniel Golle <daniel@makrotopia.org>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/xcb-proto
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X C-language Bindings protocol descriptions
  URL:=https://xcb.freedesktop.org/
  BUILDONLY:=1
endef

define Package/xcb-proto/description
  XML-XCB protocol descriptions used by libxcb for the X11 protocol & extensions.
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/share/xcb
	$(CP) $(PKG_INSTALL_DIR)/usr/share/xcb/*.xml $(1)/usr/share/xcb/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/lib/python*/site-packages/xcbgen 2>/dev/null || true
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/python*/site-packages/xcbgen $(1)/usr/lib/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,xcb-proto))
