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

PKG_BUILD_DEPENDS:=cmake/host gnustep-make swift-corelibs-libdispatch

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
  DEPENDS:=+libstdcpp +swift-corelibs-libdispatch @BROKEN
endef

define Package/libobjc2/description
  The GNUstep Objective-C Runtime is a modern implementation of the
  Objective-C runtime, with support for ARC, blocks, and non-fragile
  instance variables.
endef

CMAKE_OPTIONS += \
	-DGNUSTEP_INSTALL_TYPE=SYSTEM \
	-DCMAKE_BUILD_TYPE=Release \
	-DEMBEDDED_BLOCKS_RUNTIME=OFF \
	-DBlocksRuntime_INCLUDE_DIR=/System/Library/Headers \
	-DBlocksRuntime_LIBRARIES=/System/Library/Libraries/libBlocksRuntime.so

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
