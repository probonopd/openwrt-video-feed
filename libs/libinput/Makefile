include $(TOPDIR)/rules.mk

PKG_NAME:=libinput
PKG_VERSION:=1.26.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(PKG_VERSION)/
PKG_HASH:=5c1c4150f217fea1db2d1fd88e2607b2f1928cfde65c34da65a9f24dcfd69464

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/libinput
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Video
  TITLE:=Input device library
  URL:=https://www.freedesktop.org/wiki/Software/libinput/
  DEPENDS:=+libevdev +libmtdev +libudev-zero
endef

define Package/libinput/description
  libinput is a library to handle input devices in Wayland compositors
  and X.Org drivers. It provides device detection, device handling,
  input device event processing and abstraction so minimize the amount
  of custom input code compositors need to provide the common set of
  functionality that users expect.
  
  This build has libwacom and debug-gui disabled to avoid glib dependency.
endef

MESON_ARGS += \
	-Dlibwacom=false \
	-Ddebug-gui=false \
	-Dtests=false \
	-Ddocumentation=false \
	-Dzshcompletiondir=no

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/libinput
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libinput/*.h $(1)/usr/include/libinput/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libinput/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so.* $(1)/usr/lib/
	# Install libinput command-line tool
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/libinput $(1)/usr/bin/
	# Install libexec helpers if they exist (optional, version-dependent)
	if [ -d $(PKG_INSTALL_DIR)/usr/libexec/libinput ]; then \
		$(INSTALL_DIR) $(1)/usr/libexec/libinput; \
		$(CP) $(PKG_INSTALL_DIR)/usr/libexec/libinput/* $(1)/usr/libexec/libinput/ || true; \
	fi
endef

$(eval $(call BuildPackage,libinput))
