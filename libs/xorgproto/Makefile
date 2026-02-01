include $(TOPDIR)/rules.mk

PKG_NAME:=xorgproto
PKG_VERSION:=2024.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/proto/
PKG_HASH:=372225fd40815b8423571f84e0c686870f5c1b74883dac7a1fa2a39c77a4f79c

PKG_MAINTAINER:=Daniel Golle <daniel@makrotopia.org>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/xorgproto
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X.Org protocol headers
  URL:=https://xorg.freedesktop.org/
  BUILDONLY:=1
endef

define Package/xorgproto/description
  X Window System unified protocol definitions.
endef

MESON_ARGS += \
	-Dlegacy=true

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/GL
	$(CP) $(PKG_INSTALL_DIR)/usr/include/GL/*.h $(1)/usr/include/GL/
	$(INSTALL_DIR) $(1)/usr/include/X11
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/*.h $(1)/usr/include/X11/
	$(INSTALL_DIR) $(1)/usr/include/X11/dri
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/dri/*.h $(1)/usr/include/X11/dri/
	$(INSTALL_DIR) $(1)/usr/include/X11/extensions
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/extensions/*.h $(1)/usr/include/X11/extensions/
	$(INSTALL_DIR) $(1)/usr/include/X11/fonts
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/fonts/*.h $(1)/usr/include/X11/fonts/
	$(INSTALL_DIR) $(1)/usr/share/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/share/pkgconfig/*.pc $(1)/usr/share/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/share/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

$(eval $(call BuildPackage,xorgproto))
