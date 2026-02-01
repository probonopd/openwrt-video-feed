include $(TOPDIR)/rules.mk

PKG_NAME:=swift-corelibs-libdispatch
PKG_VERSION:=5.10
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/apple/swift-corelibs-libdispatch.git
PKG_SOURCE_VERSION:=ac3302c
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

# Require host clang for cross-compilation with -fblocks support
PKG_BUILD_DEPENDS:=cmake/host llvm/host

CMAKE_BINARY_SUBDIR:=Build
CMAKE_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/swift-corelibs-libdispatch
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=GNUstep
  TITLE:=Apple Grand Central Dispatch (libdispatch)
  URL:=https://github.com/apple/swift-corelibs-libdispatch
  DEPENDS:=+libpthread +librt +libstdcpp
endef

define Package/swift-corelibs-libdispatch/description
  Grand Central Dispatch (GCD or libdispatch) provides comprehensive
  support for concurrent code execution on multicore hardware.
endef

# Use host clang for cross-compilation (required for -fblocks support)
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
	-DCMAKE_INSTALL_PREFIX=/System/Library \
	-DCMAKE_INSTALL_LIBDIR=Libraries \
	-DINSTALL_DISPATCH_HEADERS_DIR=/System/Library/Headers/dispatch \
	-DINSTALL_BLOCK_HEADERS_DIR=/System/Library/Headers \
	-DINSTALL_OS_HEADERS_DIR=/System/Library/Headers/os \
	-DINSTALL_PRIVATE_HEADERS=ON \
	-DCMAKE_INSTALL_MANDIR=Documentation/man \
	-DCMAKE_BUILD_TYPE=Release \
	-DENABLE_TESTING=OFF \
	-DENABLE_SWIFT=OFF

define Build/Prepare
	$(call Build/Prepare/Default)
	$(SED) 's/cmake_minimum_required(VERSION 3\.[0-9]\+\(\.\.\.[0-9.]\+\)\?)/cmake_minimum_required(VERSION 3.20...3.99)/g' \
		$(PKG_BUILD_DIR)/CMakeLists.txt
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/System/Library/Headers
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Headers/* $(1)/System/Library/Headers/
	$(INSTALL_DIR) $(1)/System/Library/Libraries
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Libraries/*.so* $(1)/System/Library/Libraries/
endef

define Package/swift-corelibs-libdispatch/install
	$(INSTALL_DIR) $(1)/System/Library/Libraries
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Libraries/*.so* $(1)/System/Library/Libraries/
endef

$(eval $(call BuildPackage,swift-corelibs-libdispatch))
