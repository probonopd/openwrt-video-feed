include $(TOPDIR)/rules.mk

PKG_NAME:=libx11
PKG_VERSION:=1.8.10
PKG_RELEASE:=1

PKG_SOURCE:=libX11-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=2b3b3dad9347db41dca56beb7db5878f283bde1142f04d9f8e478af435dfdc53

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libX11-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=xorgproto libxtrans

include $(INCLUDE_DIR)/package.mk

define Package/libx11
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X11 client-side library
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+libxcb
endef

define Package/libx11/description
  X.Org X11 client-side library.
endef

CONFIGURE_ARGS += \
	--disable-specs \
	--disable-xf86bigfont \
	--without-xmlto \
	--without-fop \
	--disable-loadable-i18n

CONFIGURE_VARS += \
	xorg_cv_malloc0_returns_null=no \
	CC_FOR_BUILD="$(HOSTCC)" \
	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
	LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)"

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	# Build makekeys with host compiler first
	$(MAKE) -C $(PKG_BUILD_DIR)/src/util CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)"
	# Then build the rest with cross compiler
	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/X11
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/*.h $(1)/usr/include/X11/
	$(INSTALL_DIR) $(1)/usr/include/X11/extensions
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/extensions/*.h $(1)/usr/include/X11/extensions/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.a $(1)/usr/lib/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libx11/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/share/X11
	$(CP) $(PKG_INSTALL_DIR)/usr/share/X11/* $(1)/usr/share/X11/
endef

$(eval $(call BuildPackage,libx11))
