include $(TOPDIR)/rules.mk

PKG_NAME:=libobjc2
PKG_VERSION:=2.2.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gnustep/libobjc2.git
PKG_SOURCE_VERSION:=4148a3d
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

# Require host clang for cross-compilation with Objective-C support
PKG_BUILD_DEPENDS:=llvm/host gnustep-make swift-corelibs-libdispatch

CMAKE_BINARY_SUBDIR:=Build
CMAKE_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/libobjc2
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=GNUstep
  TITLE:=Modern Objective-C Runtime
  URL:=https://github.com/gnustep/libobjc2
  DEPENDS:=+libstdcpp +swift-corelibs-libdispatch
endef

define Package/libobjc2/description
  The GNUstep Objective-C Runtime is a modern implementation of the
  Objective-C runtime, with support for ARC, blocks, and non-fragile
  instance variables.
endef

# Use host clang for cross-compilation (required for Objective-C support)
CLANG_PATH:=$(STAGING_DIR_HOST)/llvm-mesa/bin
TARGET_CC:=$(CLANG_PATH)/clang
TARGET_CXX:=$(CLANG_PATH)/clang++

# Get the target triple from OpenWrt
CLANG_TARGET_TRIPLE:=$(subst muslgnueabi,musleabi,$(subst openwrt,unknown,$(REAL_GNU_TARGET_NAME)))

CMAKE_OPTIONS += \
	-DCMAKE_C_COMPILER=$(TARGET_CC) \
	-DCMAKE_CXX_COMPILER=$(TARGET_CXX) \
	-DCMAKE_C_COMPILER_TARGET=$(CLANG_TARGET_TRIPLE) \
	-DCMAKE_CXX_COMPILER_TARGET=$(CLANG_TARGET_TRIPLE) \
	-DCMAKE_SYSROOT=$(TOOLCHAIN_DIR) \
	-DGNUSTEP_INSTALL_TYPE=SYSTEM \
	-DCMAKE_BUILD_TYPE=Release \
	-DEMBEDDED_BLOCKS_RUNTIME=OFF \
	-DBlocksRuntime_INCLUDE_DIR=$(STAGING_DIR)/System/Library/Headers \
	-DBlocksRuntime_LIBRARIES=$(STAGING_DIR)/System/Library/Libraries/libBlocksRuntime.so

define Build/InstallDev
	$(INSTALL_DIR) $(1)/System/Library/Headers/objc
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Headers/objc/*.h $(1)/System/Library/Headers/objc/
	$(INSTALL_DIR) $(1)/System/Library/Libraries
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Libraries/*.so* $(1)/System/Library/Libraries/
endef

define Package/libobjc2/install
	$(INSTALL_DIR) $(1)/System/Library/Libraries
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Libraries/*.so* $(1)/System/Library/Libraries/
endef

$(eval $(call BuildPackage,libobjc2))
