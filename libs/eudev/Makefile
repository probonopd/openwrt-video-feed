include $(TOPDIR)/rules.mk

PKG_NAME:=eudev
PKG_VERSION:=3.2.14
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/eudev-project/eudev/releases/download/v$(PKG_VERSION)/
PKG_HASH:=8da4319102f24abbf7fff5ce9c416af848df163b29590e666d334cc1927f006f

PKG_MAINTAINER:=
PKG_LICENSE:=GPL-2.0-or-later LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libudev
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=udev device management library
  URL:=https://github.com/eudev-project/eudev
endef

define Package/libudev/description
  libudev provides a set of functions for accessing the udev database
  and querying sysfs.
endef

define Package/eudev
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=eudev device manager
  URL:=https://github.com/eudev-project/eudev
  DEPENDS:=+libudev
endef

define Package/eudev/description
  eudev is a standalone dynamic and persistent device naming support
  (aka userspace devfs) daemon.
endef

CONFIGURE_ARGS += \
	--disable-introspection \
	--disable-manpages \
	--disable-selinux \
	--disable-blkid \
	--disable-kmod \
	--disable-hwdb

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libudev.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libudev.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libudev.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libudev/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libudev.so.* $(1)/usr/lib/
endef

define Package/eudev/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/udevadm $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/udevd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/udev/rules.d
	$(INSTALL_DIR) $(1)/usr/lib/udev/rules.d
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/udev/rules.d/*.rules $(1)/usr/lib/udev/rules.d/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,libudev))
$(eval $(call BuildPackage,eudev))
