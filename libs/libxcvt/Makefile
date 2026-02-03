include $(TOPDIR)/rules.mk

PKG_NAME:=libxcvt
PKG_VERSION:=0.1.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=0561690544796e25cfbd71806ba1b0d797ffe464e9796411123e79450f71db38

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/libxcvt
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=VESA CVT standard timing modelines generator
  URL:=https://xorg.freedesktop.org/
endef

define Package/libxcvt/description
  Library and utility to generate VESA CVT standard timing modelines.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/libxcvt
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libxcvt/*.h $(1)/usr/include/libxcvt/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libxcvt/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/cvt $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libxcvt))
