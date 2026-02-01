include $(TOPDIR)/rules.mk

PKG_NAME:=gershwin-systempreferences
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gershwin-desktop/gershwin-systempreferences.git
PKG_SOURCE_VERSION:=HEAD
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=
PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk

define Package/gershwin-systempreferences
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=GNUstep
  TITLE:=Gershwin System Preferences
  URL:=https://github.com/gershwin-desktop/gershwin-systempreferences
  DEPENDS:=+gnustep-gui +gnustep-back @BROKEN
endef

define Package/gershwin-systempreferences/description
  Gershwin System Preferences provides a graphical interface for
  configuring system settings.
endef

define Build/Compile
	. /System/Library/Makefiles/GNUstep.sh 2>/dev/null || true && \
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/gershwin-systempreferences/install
	$(INSTALL_DIR) $(1)/System/Applications
	$(CP) $(PKG_BUILD_DIR)/SystemPreferences.app $(1)/System/Applications/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gershwin-systempreferences))
