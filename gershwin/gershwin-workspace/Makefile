include $(TOPDIR)/rules.mk

PKG_NAME:=gershwin-workspace
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gershwin-desktop/gershwin-workspace.git
PKG_SOURCE_VERSION:=HEAD
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=
PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/gershwin-workspace
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=GNUstep
  TITLE:=Gershwin Workspace (File Manager)
  URL:=https://github.com/gershwin-desktop/gershwin-workspace
  DEPENDS:=+gnustep-gui +gnustep-back
endef

define Package/gershwin-workspace/description
  Gershwin Workspace is the file manager for the Gershwin desktop.
  It provides a graphical interface for browsing and managing files.
endef

define Build/Configure
	cd $(PKG_BUILD_DIR) && autoreconf -fi
	$(call Build/Configure/Default)
endef

define Build/Compile
	. /System/Library/Makefiles/GNUstep.sh 2>/dev/null || true && \
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/gershwin-workspace/install
	$(INSTALL_DIR) $(1)/System/Applications
	$(CP) $(PKG_BUILD_DIR)/Workspace.app $(1)/System/Applications/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gershwin-workspace))
