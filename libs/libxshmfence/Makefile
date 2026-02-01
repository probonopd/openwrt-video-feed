include $(TOPDIR)/rules.mk

PKG_NAME:=libxshmfence
PKG_VERSION:=1.3.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=870df257bc40b126d91b5a8f1da6ca8a524555268c50b59c0acd1a27f361606f

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/libxshmfence
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X shared memory fences library
  URL:=https://xorg.freedesktop.org/
endef

define Package/libxshmfence/description
  Shared memory fences for synchronization with X server.
endef

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

define Package/libxshmfence/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libxshmfence))
