include $(TOPDIR)/rules.mk

PKG_NAME:=gnustep-base
PKG_VERSION:=1.30.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gnustep/libs-base.git
PKG_SOURCE_VERSION:=050c6cc
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=
PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING.LIB

PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1

# Require host clang for cross-compilation
PKG_BUILD_DEPENDS:=llvm/host

include $(INCLUDE_DIR)/package.mk

define Package/gnustep-base
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=GNUstep
  TITLE:=GNUstep Base Library
  URL:=https://github.com/gnustep/libs-base
  DEPENDS:=+libobjc2 +gnustep-make +swift-corelibs-libdispatch +libxml2 +libxslt \
           +gnutls +libffi +libicu +zlib
endef

define Package/gnustep-base/description
  GNUstep Base is the GNUstep implementation of the Foundation Kit.
  It provides classes for strings, arrays, dictionaries, file handling,
  networking, and more.
endef

# Use host clang for cross-compilation
CLANG_PATH:=$(STAGING_DIR_HOST)/llvm-mesa/bin
CLANG_TARGET_TRIPLE:=$(subst muslgnueabi,musleabi,$(subst openwrt,unknown,$(REAL_GNU_TARGET_NAME)))

CONFIGURE_ARGS += \
	--with-dispatch-include=$(STAGING_DIR)/System/Library/Headers \
	--with-dispatch-library=$(STAGING_DIR)/System/Library/Libraries

CONFIGURE_VARS += \
	CC="$(CLANG_PATH)/clang --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)" \
	CXX="$(CLANG_PATH)/clang++ --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)" \
	OBJC="$(CLANG_PATH)/clang --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)"

define Build/Configure
	. $(STAGING_DIR)/System/Library/Makefiles/GNUstep.sh 2>/dev/null || true
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/System/Library/Headers/Foundation
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Headers/Foundation/*.h $(1)/System/Library/Headers/Foundation/
	$(INSTALL_DIR) $(1)/System/Library/Headers/GNUstepBase
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Headers/GNUstepBase/*.h $(1)/System/Library/Headers/GNUstepBase/
	$(INSTALL_DIR) $(1)/System/Library/Libraries
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Libraries/*.so* $(1)/System/Library/Libraries/
endef

define Package/gnustep-base/install
	$(INSTALL_DIR) $(1)/System/Library/Libraries
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Libraries/*.so* $(1)/System/Library/Libraries/
	$(INSTALL_DIR) $(1)/System/Library/Bundles
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Bundles/* $(1)/System/Library/Bundles/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gnustep-base))
