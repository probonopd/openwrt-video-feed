include $(TOPDIR)/rules.mk

PKG_NAME:=gershwin-terminal
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gershwin-desktop/gershwin-terminal.git
PKG_SOURCE_VERSION:=HEAD
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=
PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk

define Package/gershwin-terminal
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=GNUstep
  TITLE:=Gershwin Terminal
  URL:=https://github.com/gershwin-desktop/gershwin-terminal
  DEPENDS:=+gnustep-gui +gnustep-back @BROKEN
endef

define Package/gershwin-terminal/description
  Gershwin Terminal is a terminal emulator for the Gershwin desktop.
endef

define Build/Compile
	. /System/Library/Makefiles/GNUstep.sh 2>/dev/null || true && \
	sed -i -e 's|-liconv ||g' $(PKG_BUILD_DIR)/GNUmakefile.preamble 2>/dev/null || true && \
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CPPFLAGS="-D__GNU__ -DGNUSTEP_INSTALL_TYPE=SYSTEM"
endef

define Package/gershwin-terminal/install
	$(INSTALL_DIR) $(1)/System/Applications
	$(CP) $(PKG_BUILD_DIR)/Terminal.app $(1)/System/Applications/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gershwin-terminal))
