include $(TOPDIR)/rules.mk

PKG_NAME:=gnustep-gui
PKG_VERSION:=0.31.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gnustep/libs-gui.git
PKG_SOURCE_VERSION:=8be638c
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=
PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING.LIB

PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1

# Require host clang for cross-compilation
PKG_BUILD_DEPENDS:=llvm/host

include $(INCLUDE_DIR)/package.mk

define Package/gnustep-gui
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=GNUstep
  TITLE:=GNUstep GUI Library
  URL:=https://github.com/gnustep/libs-gui
  DEPENDS:=+gnustep-base +libpng +libjpeg-turbo +libtiff +giflib +libcairo +libfreetype +fontconfig
endef

define Package/gnustep-gui/description
  GNUstep GUI is the GNUstep implementation of the Application Kit.
  It provides classes for windows, views, controls, menus, and
  other graphical user interface elements.
endef

# Use host clang for cross-compilation
CLANG_PATH:=$(STAGING_DIR_HOST)/llvm-mesa/bin
CLANG_TARGET_TRIPLE:=$(subst muslgnueabi,musleabi,$(subst openwrt,unknown,$(REAL_GNU_TARGET_NAME)))

CONFIGURE_VARS += \
	CC="$(CLANG_PATH)/clang --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)" \
	CXX="$(CLANG_PATH)/clang++ --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)" \
	OBJC="$(CLANG_PATH)/clang --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)"

define Build/Configure
	. $(STAGING_DIR)/System/Library/Makefiles/GNUstep.sh 2>/dev/null || true
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/System/Library/Headers/AppKit
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Headers/AppKit/*.h $(1)/System/Library/Headers/AppKit/
	$(INSTALL_DIR) $(1)/System/Library/Headers/Cocoa
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Headers/Cocoa/*.h $(1)/System/Library/Headers/Cocoa/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/System/Library/Libraries
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Libraries/*.so* $(1)/System/Library/Libraries/
endef

define Package/gnustep-gui/install
	$(INSTALL_DIR) $(1)/System/Library/Libraries
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Libraries/*.so* $(1)/System/Library/Libraries/
	$(INSTALL_DIR) $(1)/System/Library/Bundles
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Bundles/* $(1)/System/Library/Bundles/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/System/Library/ColorPickers
	$(CP) $(PKG_INSTALL_DIR)/System/Library/ColorPickers/* $(1)/System/Library/ColorPickers/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gnustep-gui))
