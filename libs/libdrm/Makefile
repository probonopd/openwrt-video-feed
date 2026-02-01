include $(TOPDIR)/rules.mk

PKG_NAME:=libdrm
PKG_VERSION:=2.4.123
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://dri.freedesktop.org/libdrm/
PKG_HASH:=a2b98567a149a74b0f50e91e825f9c0315d86e7be9b74394dae8b298caadb79e

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/libdrm
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=Direct Rendering Manager library
  URL:=https://dri.freedesktop.org/
  DEPENDS:=+libpciaccess
endef

define Package/libdrm/description
  libdrm provides the userspace interface to the kernel Direct Rendering
  Manager services.
endef

MESON_ARGS += \
	-Dintel=enabled \
	-Dradeon=enabled \
	-Damdgpu=enabled \
	-Dnouveau=enabled \
	-Dvmwgfx=enabled \
	-Dfreedreno=disabled \
	-Dvc4=disabled \
	-Detnaviv=disabled \
	-Dexynos=disabled \
	-Dtegra=disabled \
	-Dcairo-tests=disabled \
	-Dman-pages=disabled \
	-Dvalgrind=disabled \
	-Dtests=false \
	-Dudev=true

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libdrm/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libdrm))
