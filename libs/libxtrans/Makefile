include $(TOPDIR)/rules.mk

PKG_NAME:=libxtrans
PKG_VERSION:=1.5.2
PKG_RELEASE:=1

PKG_SOURCE:=xtrans-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=5c5cbfe34764a9131d048f03c31c19e57fb4c682d67713eab6a65541b4dff86c

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/xtrans-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libxtrans
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X transport library
  URL:=https://xorg.freedesktop.org/
  BUILDONLY:=1
endef

define Package/libxtrans/description
  X.Org xtrans network transport library.
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/X11/Xtrans
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/Xtrans/*.h $(1)/usr/include/X11/Xtrans/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/Xtrans/*.c $(1)/usr/include/X11/Xtrans/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/share/aclocal
	$(CP) $(PKG_INSTALL_DIR)/usr/share/aclocal/*.m4 $(1)/usr/share/aclocal/
	$(INSTALL_DIR) $(1)/usr/share/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/share/pkgconfig/*.pc $(1)/usr/share/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/share/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

$(eval $(call BuildPackage,libxtrans))
