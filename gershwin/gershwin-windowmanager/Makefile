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

# Require host clang for cross-compilation
PKG_BUILD_DEPENDS:=llvm/host

include $(INCLUDE_DIR)/package.mk

# Use host clang for cross-compilation
CLANG_PATH:=$(STAGING_DIR_HOST)/llvm-mesa/bin
CLANG_TARGET_TRIPLE:=$(subst muslgnueabi,musleabi,$(subst openwrt,unknown,$(REAL_GNU_TARGET_NAME)))

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
	. $(STAGING_DIR)/System/Library/Makefiles/GNUstep.sh 2>/dev/null || true && \
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(CLANG_PATH)/clang --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)" \
		OBJC="$(CLANG_PATH)/clang --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)"/WindowManager \
		CPPFLAGS="-DGNUSTEP_INSTALL_TYPE=SYSTEM"
endef

define Package/gershwin-windowmanager/install
	$(INSTALL_DIR) $(1)/System/Applications
	$(CP) $(PKG_BUILD_DIR)/WindowManager/WindowManager.app $(1)/System/Applications/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gershwin-windowmanager))
