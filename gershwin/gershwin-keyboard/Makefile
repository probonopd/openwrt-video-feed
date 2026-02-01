include $(TOPDIR)/rules.mk

PKG_NAME:=gershwin-keyboard
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

# Require host clang for cross-compilation
PKG_BUILD_DEPENDS:=llvm/host

include $(INCLUDE_DIR)/package.mk

# Use host clang for cross-compilation
CLANG_PATH:=$(STAGING_DIR_HOST)/llvm-mesa/bin
CLANG_TARGET_TRIPLE:=$(subst muslgnueabi,musleabi,$(subst openwrt,unknown,$(REAL_GNU_TARGET_NAME)))

define Package/gershwin-keyboard
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=GNUstep
  TITLE:=Gershwin Keyboard Preferences
  URL:=https://github.com/gershwin-desktop/gershwin-components
  DEPENDS:=+gnustep-gui +gnustep-back
endef

define Package/gershwin-keyboard/description
  Gershwin Keyboard provides keyboard configuration for the Gershwin desktop.
endef

define Build/Compile
	. $(STAGING_DIR)/System/Library/Makefiles/GNUstep.sh 2>/dev/null || true && \
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(CLANG_PATH)/clang --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)" \
		OBJC="$(CLANG_PATH)/clang --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)"/Keyboard \
		CPPFLAGS="-DGNUSTEP_INSTALL_TYPE=SYSTEM"
endef

define Package/gershwin-keyboard/install
	$(INSTALL_DIR) $(1)/System/Library/PreferencePanes
	$(CP) $(PKG_BUILD_DIR)/Keyboard/Keyboard.prefPane $(1)/System/Library/PreferencePanes/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gershwin-keyboard))
