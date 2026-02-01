include $(TOPDIR)/rules.mk

PKG_NAME:=libfontenc
PKG_VERSION:=1.1.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=7b02c3d405236e0d86806b1de9d6868fe60c313628b38350b032914aa4fd14c6

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=xorgproto xorg-macros

include $(INCLUDE_DIR)/package.mk

define Package/libfontenc
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X font encoding library
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+zlib
endef

define Package/libfontenc/description
  X.Org font encoding library for handling font character set encodings.
endef

CONFIGURE_ARGS += \
	--with-fontrootdir=/usr/share/fonts/X11

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/X11/fonts
	$(CP) $(PKG_INSTALL_DIR)/usr/include/X11/fonts/*.h $(1)/usr/include/X11/fonts/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.a $(1)/usr/lib/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libfontenc/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libfontenc))
