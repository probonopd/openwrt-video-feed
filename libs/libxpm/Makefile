include $(TOPDIR)/rules.mk

PKG_NAME:=libxpm
PKG_VERSION:=3.5.17
PKG_RELEASE:=1

PKG_SOURCE:=libXpm-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libXpm-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=xorgproto gettext-full/host

include $(INCLUDE_DIR)/package.mk

define Package/libxpm
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X11 pixmap library
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+libx11 +libxext +libxt
endef

define Package/libxpm/description
  X11 pixmap library.
endef

CONFIGURE_ARGS += \
	--disable-stat-zfile

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/X11
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/*.h $(1)/usr/include/X11/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.a $(1)/usr/lib/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libxpm/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libxpm))
