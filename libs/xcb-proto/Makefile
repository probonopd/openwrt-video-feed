include $(TOPDIR)/rules.mk

PKG_NAME:=xcb-proto
PKG_VERSION:=1.17.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/proto/
PKG_HASH:=2c1bacd2110f4799f74de6ebb714b94cf6f80fb112316b1219480fd22562148c

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/xcb-proto
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X C-language Bindings protocol descriptions
  URL:=https://xcb.freedesktop.org/
  BUILDONLY:=1
endef

define Package/xcb-proto/description
  XML-XCB protocol descriptions used by libxcb for the X11 protocol & extensions.
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/share/xcb
	$(CP) $(PKG_INSTALL_DIR)/usr/share/xcb/*.xml $(1)/usr/share/xcb/
	$(INSTALL_DIR) $(1)/usr/share/pkgconfig
	$(SED) 's|$$$${pc_sysrootdir}||g' $(PKG_INSTALL_DIR)/usr/share/pkgconfig/xcb-proto.pc
	$(SED) 's|datadir=/usr/share|datadir=$(STAGING_DIR)/usr/share|g' $(PKG_INSTALL_DIR)/usr/share/pkgconfig/xcb-proto.pc
	$(SED) 's|PYTHON_PREFIX=/usr|PYTHON_PREFIX=$(STAGING_DIR)/usr|g' $(PKG_INSTALL_DIR)/usr/share/pkgconfig/xcb-proto.pc
	$(SED) 's|pythondir=.*|pythondir=$(STAGING_DIR)/usr/lib/python3/site-packages|g' $(PKG_INSTALL_DIR)/usr/share/pkgconfig/xcb-proto.pc
	$(CP) $(PKG_INSTALL_DIR)/usr/share/pkgconfig/*.pc $(1)/usr/share/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/share/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/lib/python3/site-packages
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/python*/dist-packages/xcbgen $(1)/usr/lib/python3/site-packages/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,xcb-proto))
