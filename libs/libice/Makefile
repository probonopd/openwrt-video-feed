include $(TOPDIR)/rules.mk

PKG_NAME:=libice
PKG_VERSION:=1.1.2
PKG_RELEASE:=1

PKG_SOURCE:=libICE-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=974e4ed414225eb3c716985df9709f4da8d22a67a2890066bc6dfc89ad298625

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libICE-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=xorgproto libxtrans

include $(INCLUDE_DIR)/package.mk

define Package/libice
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X Inter-Client Exchange library
  URL:=https://xorg.freedesktop.org/
endef

define Package/libice/description
  X Inter-Client Exchange library.
endef

CONFIGURE_ARGS += \
	--without-xmlto \
	--without-fop

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/X11/ICE
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/ICE/*.h $(1)/usr/include/X11/ICE/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.a $(1)/usr/lib/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libice/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libice))
