include $(TOPDIR)/rules.mk

PKG_NAME:=gershwin-assets
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gershwin-desktop/gershwin-assets.git
PKG_SOURCE_VERSION:=HEAD
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/gershwin-assets
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=GNUstep
  TITLE:=Gershwin Assets
  URL:=https://github.com/gershwin-desktop/gershwin-assets
  DEPENDS:=+gershwin-system
endef

define Package/gershwin-assets/description
  Gershwin Assets provides icons, images, and other graphical
  resources for the Gershwin desktop environment.
endef

define Build/Compile
	@true
endef

define Package/gershwin-assets/install
	$(INSTALL_DIR) $(1)/System/Library
	$(CP) $(PKG_BUILD_DIR)/Library/* $(1)/System/Library/
endef

$(eval $(call BuildPackage,gershwin-assets))
