include $(TOPDIR)/rules.mk

PKG_NAME:=libxfont2
PKG_VERSION:=2.0.7
PKG_RELEASE:=1

PKG_SOURCE:=libXfont2-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb

PKG_MAINTAINER:=Daniel Golle <daniel@makrotopia.org>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libXfont2-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=xorgproto libxtrans

include $(INCLUDE_DIR)/package.mk

define Package/libxfont2
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X font handling library
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+libfreetype +fontconfig +zlib +libbz2
endef

define Package/libxfont2/description
  X.Org library providing font handling for X servers.
endef

CONFIGURE_ARGS += \
	--disable-devel-docs \
	--without-xmlto \
	--without-fop

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/X11/fonts
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/fonts/*.h $(1)/usr/include/X11/fonts/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.a $(1)/usr/lib/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libxfont2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libxfont2))
