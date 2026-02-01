include $(TOPDIR)/rules.mk

PKG_NAME:=libxmu
PKG_VERSION:=1.2.1
PKG_RELEASE:=1

PKG_SOURCE:=libXmu-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=skip

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libXmu-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/libxmu
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X miscellaneous utility library
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+libx11 +libxext +libxt
endef

define Package/libxmu/description
  X.Org miscellaneous utility library.
endef

define Package/libxmuu
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X miscellaneous utility library (lite)
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+libx11
endef

define Package/libxmuu/description
  Lite X.Org miscellaneous utility library.
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
	$(INSTALL_DIR) $(1)/usr/include/X11
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/*.h $(1)/usr/include/X11/
	$(INSTALL_DIR) $(1)/usr/include/X11/Xmu
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/Xmu/*.h $(1)/usr/include/X11/Xmu/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.a $(1)/usr/lib/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libxmu/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libXmu.so.* $(1)/usr/lib/
endef

define Package/libxmuu/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libXmuu.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libxmu))
$(eval $(call BuildPackage,libxmuu))
