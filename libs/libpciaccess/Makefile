include $(TOPDIR)/rules.mk

PKG_NAME:=libpciaccess
PKG_VERSION:=0.18.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://xorg.freedesktop.org/archive/individual/lib/
PKG_HASH:=4af43444b38adb5545d0ed1c2ce46d9608cc47b31c2387fc5181656765a6fa76

PKG_MAINTAINER:=Daniel Golle <daniel@makrotopia.org>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/libpciaccess
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=PCI access library
  URL:=https://xorg.freedesktop.org/
  DEPENDS:=+zlib
endef

define Package/libpciaccess/description
  Library providing generic access to PCI bus configuration space.
endef

MESON_ARGS += \
	-Dpci-ids=/usr/share/hwdata/pci.ids \
	-Dzlib=enabled

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libpciaccess/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libpciaccess))
