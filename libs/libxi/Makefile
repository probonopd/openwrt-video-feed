include $(TOPDIR)/rules.mk

PKG_NAME:=libxi
PKG_VERSION:=1.8.2
PKG_RELEASE:=1

PKG_SOURCE:=libXi-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=d0e0555e53d6e2114eabfa44226ba162d2708501a25e18d99cfb35c094c6c104

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libXi-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/libxi
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X11 Input extension library
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+libx11 +libxext +libxfixes
endef

define Package/libxi/description
  X11 Input extension library.
endef

CONFIGURE_ARGS += \
	--without-xmlto \
	--without-fop \
	--disable-docs \
	--disable-specs

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/X11/extensions
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/extensions/*.h $(1)/usr/include/X11/extensions/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.a $(1)/usr/lib/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libxi/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libxi))
