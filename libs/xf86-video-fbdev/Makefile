include $(TOPDIR)/rules.mk

PKG_NAME:=xf86-video-fbdev
PKG_VERSION:=0.5.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/driver/
PKG_HASH:=9c2bc0fb9af092804138e8d5cb5627cabf2919ef60f0d1544a95c4ac2047f387

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=xlibre xorgproto

include $(INCLUDE_DIR)/package.mk

define Package/xf86-video-fbdev
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=X.Org fbdev video driver
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+xlibre
endef

define Package/xf86-video-fbdev/description
  Generic Linux framebuffer video driver for X.Org.
endef

CONFIGURE_ARGS += \
	--with-xorg-module-dir=/usr/lib/xorg/modules

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/xf86-video-fbdev/install
	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules/drivers
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/xorg/modules/drivers/*.so $(1)/usr/lib/xorg/modules/drivers/
endef

$(eval $(call BuildPackage,xf86-video-fbdev))
