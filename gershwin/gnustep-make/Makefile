include $(TOPDIR)/rules.mk

PKG_NAME:=gnustep-make
PKG_VERSION:=2.9.2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gnustep/tools-make.git
PKG_SOURCE_VERSION:=8964f83
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=
PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=COPYING

PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1

# Require host clang for cross-compilation
PKG_BUILD_DEPENDS:=llvm/host

include $(INCLUDE_DIR)/package.mk

define Package/gnustep-make
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=GNUstep
  TITLE:=GNUstep Make
  URL:=https://github.com/gnustep/tools-make
  DEPENDS:=+swift-corelibs-libdispatch
endef

define Package/gnustep-make/description
  GNUstep Make is a makefile package for building GNUstep applications.
  It provides a simple and powerful way to build Objective-C applications
  using the GNUstep framework.
endef

# Use host clang for cross-compilation
CLANG_PATH:=$(STAGING_DIR_HOST)/llvm-mesa/bin

CONFIGURE_ARGS += \
	--enable-importing-config-file \
	--with-config-file=/System/Library/Preferences/GNUstep.conf \
	--with-library-combo=ng-gnu-gnu \
	--with-objc-lib-flag=" "

CONFIGURE_VARS += \
	CC="$(CLANG_PATH)/clang" \
	CXX="$(CLANG_PATH)/clang++" \
	LDFLAGS="-L$(STAGING_DIR)/System/Library/Libraries" \
	CPPFLAGS="-I$(STAGING_DIR)/System/Library/Headers" \
	libobjc_LIBS=" "

define Build/InstallDev
	$(INSTALL_DIR) $(1)/System/Library/Makefiles
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Makefiles/* $(1)/System/Library/Makefiles/
	$(INSTALL_DIR) $(STAGING_DIR)/System/Library/Makefiles
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Makefiles/* $(STAGING_DIR)/System/Library/Makefiles/
endef

define Package/gnustep-make/install
	$(INSTALL_DIR) $(1)/System/Library/Makefiles
	$(CP) $(PKG_INSTALL_DIR)/System/Library/Makefiles/* $(1)/System/Library/Makefiles/
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/System/Tools/* $(1)/usr/bin/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,gnustep-make))
