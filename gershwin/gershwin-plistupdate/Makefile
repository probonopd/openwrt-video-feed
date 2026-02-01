include $(TOPDIR)/rules.mk

PKG_NAME:=gershwin-plistupdate
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gershwin-desktop/gershwin-components.git
PKG_SOURCE_VERSION:=HEAD
PKG_MIRROR_HASH:=skip
PKG_SOURCE_SUBDIR:=gershwin-components

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/gershwin-plistupdate
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=GNUstep
  TITLE:=Gershwin Plist Update Tool
  URL:=https://github.com/gershwin-desktop/gershwin-components
  DEPENDS:=+gnustep-base +gnustep-make
endef

define Package/gershwin-plistupdate/description
  Hook into tools-make to inject build time and git hash into
  Info-gnustep.plist files.
endef

define Build/Compile
	. /System/Library/Makefiles/GNUstep.sh 2>/dev/null || true && \
	$(MAKE) -C $(PKG_BUILD_DIR)/plistupdate \
		CPPFLAGS="-DGNUSTEP_INSTALL_TYPE=SYSTEM"
endef

define Package/gershwin-plistupdate/install
	$(INSTALL_DIR) $(1)/System/Tools
	$(CP) $(PKG_BUILD_DIR)/plistupdate/plistupdate $(1)/System/Tools/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gershwin-plistupdate))
