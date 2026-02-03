include $(TOPDIR)/rules.mk

PKG_NAME:=pixman
PKG_VERSION:=0.43.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://cairographics.org/releases/
PKG_HASH:=a0624db90180c7ddb79fc7a9151093dc37c646d8c38d3f232f767cf64b85a226

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/pixman
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=Low-level pixel manipulation library
  URL:=https://pixman.org/
endef

define Package/pixman/description
  pixman is a low-level software library for pixel manipulation, providing
  features such as image compositing and trapezoid rasterization.
endef

MESON_ARGS += \
	-Dgtk=disabled \
	-Dlibpng=disabled \
	-Dtests=disabled \
	-Ddemos=disabled

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/pixman-1
	$(CP) $(PKG_INSTALL_DIR)/usr/include/pixman-1/*.h $(1)/usr/include/pixman-1/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpixman*.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/pixman/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpixman*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,pixman))
