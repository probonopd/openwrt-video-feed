include $(TOPDIR)/rules.mk

PKG_NAME:=freetype
PKG_VERSION:=2.13.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@SF/freetype
PKG_HASH:=0550350666d427c74daeb85d5ac7bb353acba5f76956395995311a9c6f063289

PKG_MAINTAINER:=
PKG_LICENSE:=FTL GPL-2.0-or-later
PKG_LICENSE_FILES:=LICENSE.TXT

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=zlib

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/libfreetype
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=FreeType font rendering library
  URL:=https://freetype.org/
  DEPENDS:=+zlib
endef

define Package/libfreetype/description
  FreeType is a freely available software library to render fonts.
endef

MESON_ARGS += \
	-Dzlib=enabled \
	-Dbzip2=disabled \
	-Dpng=disabled \
	-Dharfbuzz=disabled \
	-Dbrotli=disabled \
	-Dmmap=enabled \
	-Dtests=disabled

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/freetype2
	$(CP) $(PKG_INSTALL_DIR)/usr/include/freetype2/* $(1)/usr/include/freetype2/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfreetype.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libfreetype/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfreetype.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libfreetype))
