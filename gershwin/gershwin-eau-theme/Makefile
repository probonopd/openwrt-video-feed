include $(TOPDIR)/rules.mk

PKG_NAME:=gershwin-eau-theme
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gershwin-desktop/gershwin-eau-theme.git
PKG_SOURCE_VERSION:=HEAD
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=
PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk

define Package/gershwin-eau-theme
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=GNUstep
  TITLE:=Gershwin Eau Theme
  URL:=https://github.com/gershwin-desktop/gershwin-eau-theme
  DEPENDS:=+gnustep-gui @BROKEN
endef

define Package/gershwin-eau-theme/description
  Gershwin Eau Theme provides a modern look and feel for
  GNUstep/Gershwin applications.
endef

define Build/Compile
	. /System/Library/Makefiles/GNUstep.sh 2>/dev/null || true && \
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/gershwin-eau-theme/install
	$(INSTALL_DIR) $(1)/System/Library/Themes
	$(CP) $(PKG_BUILD_DIR)/Eau.theme $(1)/System/Library/Themes/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gershwin-eau-theme))
