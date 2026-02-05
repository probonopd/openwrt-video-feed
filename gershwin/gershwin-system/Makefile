include $(TOPDIR)/rules.mk

PKG_NAME:=gershwin-system
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gershwin-desktop/gershwin-system.git
PKG_SOURCE_VERSION:=HEAD
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/gershwin-system
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=GNUstep
  TITLE:=Gershwin System Domain
  URL:=https://github.com/gershwin-desktop/gershwin-system
endef

define Package/gershwin-system/description
  Gershwin System Domain provides the base filesystem structure
  and configuration for the GNUstep/Gershwin desktop environment.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR=$(PKG_INSTALL_DIR)
endef

define Build/Install
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR=$(PKG_INSTALL_DIR) \
		install
endef

define Package/gershwin-system/install
	$(INSTALL_DIR) $(1)/System/Library/Preferences
	$(CP) $(PKG_INSTALL_DIR)/System/Library/* $(1)/System/Library/ 2>/dev/null || true
	if [ -f $(PKG_BUILD_DIR)/GNUstep.conf ]; then \
		$(INSTALL_DATA) $(PKG_BUILD_DIR)/GNUstep.conf $(1)/System/Library/Preferences/; \
	fi
endef

$(eval $(call BuildPackage,gershwin-system))
