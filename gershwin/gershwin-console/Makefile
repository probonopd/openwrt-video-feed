include $(TOPDIR)/rules.mk

PKG_NAME:=gershwin-console
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

define Package/gershwin-console
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=GNUstep
  TITLE:=Gershwin Console
  URL:=https://github.com/gershwin-desktop/gershwin-components
  DEPENDS:=+gnustep-gui +gnustep-back @BROKEN
endef

define Package/gershwin-console/description
  Gershwin Console provides a system log viewer
  for the Gershwin desktop.
endef

define Build/Compile
	. /System/Library/Makefiles/GNUstep.sh 2>/dev/null || true && \
	$(MAKE) -C $(PKG_BUILD_DIR)/Console \
		CPPFLAGS="-DGNUSTEP_INSTALL_TYPE=SYSTEM"
endef

define Package/gershwin-console/install
	$(INSTALL_DIR) $(1)/System/Applications
	$(CP) $(PKG_BUILD_DIR)/Console/Console.app $(1)/System/Applications/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gershwin-console))
