include $(TOPDIR)/rules.mk

PKG_NAME:=gnustep-back
PKG_VERSION:=0.31.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gnustep/libs-back.git
PKG_SOURCE_VERSION:=bf3b3ce
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=
PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING.LIB

PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1

# Require host clang for cross-compilation
PKG_BUILD_DEPENDS:=llvm/host

include $(INCLUDE_DIR)/package.mk

define Package/gnustep-back
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=GNUstep
  TITLE:=GNUstep Backend
  URL:=https://github.com/gnustep/libs-back
  DEPENDS:=+gnustep-gui +libcairo
endef

define Package/gnustep-back/description
  GNUstep Back is the backend for the GNUstep GUI library.
  It provides the connection between the AppKit and the
  underlying graphics and windowing system.
endef

# Use host clang for cross-compilation
CLANG_PATH:=$(STAGING_DIR_HOST)/llvm-mesa/bin
CLANG_TARGET_TRIPLE:=$(subst muslgnueabi,musleabi,$(subst openwrt,unknown,$(REAL_GNU_TARGET_NAME)))

MAKE_FLAGS += \
	fonts=no

# Use Cairo graphics backend without X11 for initial build
CONFIGURE_ARGS += \
	--enable-graphics=cairo \
	--enable-server=headless

CONFIGURE_VARS += \
	CC="$(CLANG_PATH)/clang --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)" \
	CXX="$(CLANG_PATH)/clang++ --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)" \
	OBJC="$(CLANG_PATH)/clang --target=$(CLANG_TARGET_TRIPLE) --sysroot=$(TOOLCHAIN_DIR)"

define Build/Configure
	. $(STAGING_DIR)/System/Library/Makefiles/GNUstep.sh 2>/dev/null || true
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/System/Library/Libraries
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Libraries/*.so* $(1)/System/Library/Libraries/
endef

define Package/gnustep-back/install
	$(INSTALL_DIR) $(1)/System/Library/Bundles
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Bundles/* $(1)/System/Library/Bundles/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/System/Library/Libraries
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Libraries/*.so* $(1)/System/Library/Libraries/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gnustep-back))
