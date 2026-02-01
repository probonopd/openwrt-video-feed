include $(TOPDIR)/rules.mk

PKG_NAME:=libmtdev
PKG_VERSION:=1.1.7
PKG_RELEASE:=1

PKG_SOURCE:=mtdev-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://bitmath.org/code/mtdev/
PKG_HASH:=a107adad2101fecac54ac7f9f0e0a0dd155d954193da55c2340c97f2ff1d814e

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/mtdev-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libmtdev
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=Multitouch Protocol Translation Library
  URL:=https://bitmath.org/code/mtdev/
endef

define Package/libmtdev/description
  mtdev is a stand-alone library which transforms all variants of kernel
  multitouch events to the slotted type B protocol.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.a $(1)/usr/lib/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libmtdev/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libmtdev))
