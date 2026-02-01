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

# Require host clang for cross-compilation
PKG_BUILD_DEPENDS:=llvm/host

include $(INCLUDE_DIR)/package.mk

# Use host clang for cross-compilation
CLANG_PATH:=$(STAGING_DIR_HOST)/llvm-mesa/bin
CLANG_TARGET_TRIPLE:=$(subst muslgnueabi,musleabi,$(subst openwrt,unknown,$(REAL_GNU_TARGET_NAME)))

define Package/gershwin-eau-theme
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=GNUstep
  TITLE:=Gershwin Eau Theme
  URL:=https://github.com/gershwin-desktop/gershwin-eau-theme
  DEPENDS:=+gnustep-gui
endef

define Package/gershwin-eau-theme/description
  Gershwin Eau Theme provides a modern look and feel for
  GNUstep/Gershwin applications.
endef

define Build/Compile
	. $(STAGING_DIR)/System/Library/Makefiles/GNUstep.sh 2>/dev/null || true && \
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(CLANG_PATH)/clang --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)" \
		OBJC="$(CLANG_PATH)/clang --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)"
endef

define Package/gershwin-eau-theme/install
	$(INSTALL_DIR) $(1)/System/Library/Themes
	$(CP) $(PKG_BUILD_DIR)/Eau.theme $(1)/System/Library/Themes/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gershwin-eau-theme))
