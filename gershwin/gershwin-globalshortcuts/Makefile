include $(TOPDIR)/rules.mk

PKG_NAME:=gershwin-globalshortcuts
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gershwin-desktop/gershwin-components.git
PKG_SOURCE_VERSION:=HEAD
PKG_MIRROR_HASH:=skip
PKG_SOURCE_SUBDIR:=gershwin-components

PKG_MAINTAINER:=
PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk

define Package/gershwin-globalshortcuts
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=GNUstep
  TITLE:=Gershwin Global Shortcuts
  URL:=https://github.com/gershwin-desktop/gershwin-components
  DEPENDS:=+gnustep-gui +gnustep-back @BROKEN
endef

define Package/gershwin-globalshortcuts/description
  Gershwin GlobalShortcuts provides global keyboard shortcut
  configuration for the Gershwin desktop.
endef

define Build/Compile
	. /System/Library/Makefiles/GNUstep.sh 2>/dev/null || true && \
	$(MAKE) -C $(PKG_BUILD_DIR)/GlobalShortcuts \
		CPPFLAGS="-DGNUSTEP_INSTALL_TYPE=SYSTEM"
endef

define Package/gershwin-globalshortcuts/install
	$(INSTALL_DIR) $(1)/System/Library/PreferencePanes
	$(CP) $(PKG_BUILD_DIR)/GlobalShortcuts/GlobalShortcuts.prefPane $(1)/System/Library/PreferencePanes/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gershwin-globalshortcuts))
