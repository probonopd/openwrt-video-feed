include $(TOPDIR)/rules.mk

PKG_NAME:=gershwin-xcbkit
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

define Package/gershwin-xcbkit
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=GNUstep
  TITLE:=XCBKit Framework
  URL:=https://github.com/gershwin-desktop/gershwin-windowmanager
  DEPENDS:=+gnustep-gui +libxcb +xcb-util +xcb-util-wm +xcb-util-keysyms
endef

define Package/gershwin-xcbkit/description
  XCBKit is an Objective-C framework providing a wrapper around
  the XCB library for the Gershwin window manager.
endef

define Build/Compile
	. $(STAGING_DIR)/System/Library/Makefiles/GNUstep.sh 2>/dev/null || true && \
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(CLANG_PATH)/clang --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)" \
		OBJC="$(CLANG_PATH)/clang --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)"/XCBKit \
		CPPFLAGS="-DGNUSTEP_INSTALL_TYPE=SYSTEM -include unistd.h"
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/System/Library/Frameworks
	$(CP) $(PKG_BUILD_DIR)/XCBKit/XCBKit.framework $(1)/System/Library/Frameworks/ 2>/dev/null || true
endef

define Package/gershwin-xcbkit/install
	$(INSTALL_DIR) $(1)/System/Library/Frameworks
	$(CP) $(PKG_BUILD_DIR)/XCBKit/XCBKit.framework $(1)/System/Library/Frameworks/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gershwin-xcbkit))
