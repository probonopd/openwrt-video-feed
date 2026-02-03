include $(TOPDIR)/rules.mk

PKG_NAME:=libxt
PKG_VERSION:=1.3.1
PKG_RELEASE:=1

PKG_SOURCE:=libXt-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=e0a774b33324f4d4c05b199ea45050f87206586d81655f8bef4dba434d931288

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libXt-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/libxt
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X Toolkit Intrinsics library
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+libx11 +libsm +libice
endef

define Package/libxt/description
  X Toolkit Intrinsics library.
endef

CONFIGURE_ARGS += \
	--with-appdefaultdir=/usr/share/X11/app-defaults

CONFIGURE_VARS += \
	xorg_cv_malloc0_returns_null=no \
	CC_FOR_BUILD="$(HOSTCC)" \
	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
	LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)"

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	# Build makestrs with host compiler first if it exists
	if [ -d $(PKG_BUILD_DIR)/util ]; then \
		$(MAKE) -C $(PKG_BUILD_DIR)/util CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" 2>/dev/null || true; \
	fi
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

define Package/libxt/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libxt))
