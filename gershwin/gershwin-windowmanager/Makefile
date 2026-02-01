include $(TOPDIR)/rules.mk

PKG_NAME:=gershwin-windowmanager
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gershwin-desktop/gershwin-windowmanager.git
PKG_SOURCE_VERSION:=HEAD
PKG_MIRROR_HASH:=skip
PKG_SOURCE_SUBDIR:=gershwin-windowmanager

PKG_MAINTAINER:=
PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk

define Package/gershwin-windowmanager
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=GNUstep
  TITLE:=Gershwin Window Manager
  URL:=https://github.com/gershwin-desktop/gershwin-windowmanager
  DEPENDS:=+gershwin-xcbkit +gnustep-gui +gnustep-back
endef

define Package/gershwin-windowmanager/description
  Gershwin Window Manager is the window manager for the Gershwin desktop.
  It provides window decorations, virtual desktops, and window management.
endef

define Build/Compile
	. /System/Library/Makefiles/GNUstep.sh 2>/dev/null || true && \
	$(MAKE) -C $(PKG_BUILD_DIR)/WindowManager \
		CPPFLAGS="-DGNUSTEP_INSTALL_TYPE=SYSTEM"
endef

define Package/gershwin-windowmanager/install
	$(INSTALL_DIR) $(1)/System/Applications
	$(CP) $(PKG_BUILD_DIR)/WindowManager/WindowManager.app $(1)/System/Applications/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gershwin-windowmanager))
