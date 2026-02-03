include $(TOPDIR)/rules.mk

PKG_NAME:=libxcb
PKG_VERSION:=1.17.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=599ebf9996710fea71622e6e184f3a8ad5b43d0e5fa8c4e407123c88a59a6d55

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1
PKG_BUILD_DEPENDS:=xcb-proto xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/libxcb
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X C-language Bindings library
  URL:=https://xcb.freedesktop.org/
  DEPENDS:=+libxau +libxdmcp
endef

define Package/libxcb/description
  X C-language Bindings library - a replacement for Xlib.
endef

CONFIGURE_ARGS += \
	--disable-devel-docs \
	--without-doxygen

CONFIGURE_VARS += \
	XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
	XCBPROTO_XCBPYTHONDIR=$(STAGING_DIR)/usr/lib/python3/site-packages

MAKE_VARS += \
	PYTHONPATH=$(STAGING_DIR)/usr/lib/python3/site-packages

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/xcb
	$(CP) $(PKG_INSTALL_DIR)/usr/include/xcb/*.h $(1)/usr/include/xcb/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.a $(1)/usr/lib/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libxcb/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libxcb))
