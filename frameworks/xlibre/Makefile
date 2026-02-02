include $(TOPDIR)/rules.mk

PKG_NAME:=xlibre
PKG_VERSION:=25.1.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/X11Libre/xserver.git
PKG_SOURCE_VERSION:=de8eb403aa30a0201b6c1787ce377e5f4aaf331a
PKG_MIRROR_HASH:=6be6f89e3aec5dea4b09cf02a89a20073e1f5acaf96723e2c13ba339f1a86fbb

PKG_MAINTAINER:=
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=xorgproto libxtrans

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/xlibre
  SECTION:=video-frameworks
  CATEGORY:=Video
  SUBMENU:=Frameworks and Toolkits
  TITLE:=XLibre X server
  URL:=https://github.com/X11Libre/xserver
  DEPENDS:=+libdrm +libpciaccess +libx11 +libxau \
	+libxcb +libxcvt +libxdmcp +libxext +libxfixes +libxfont2 +libxkbfile \
	+libxshmfence +pixman +libnettle +xkbcomp
endef

define Package/xlibre/description
  XLibre is a display server implementation of the X Window System Protocol
  Version 11. It has been forked from the X.Org Server to clean up and
  strengthen the existing code base while maintaining backward compatibility
  to make X11 a viable choice for the future.
endef

MESON_ARGS += \
	-Dxorg=true \
	-Dxephyr=false \
	-Dxfbdev=false \
	-Dxnest=false \
	-Dxvfb=false \
	-Dxwin=false \
	-Dxquartz=false \
	-Dglamor=false \
	-Dglx=false \
	-Ddri1=false \
	-Ddri2=false \
	-Ddri3=false \
	-Ddrm=true \
	-Dudev=false \
	-Dudev_kms=false \
	-Dhal=false \
	-Dsystemd_logind=false \
	-Dsystemd_notify=false \
	-Dseatd_libseat=false \
	-Dxdmcp=true \
	-Dxdm-auth-1=true \
	-Dipv6=auto \
	-Ddpms=true \
	-Dscreensaver=true \
	-Dxres=true \
	-Dxinerama=true \
	-Dxv=true \
	-Dxvmc=false \
	-Ddga=false \
	-Dxf86bigfont=false \
	-Dsha1=libnettle \
	-Ddefault_font_path=/usr/share/fonts/X11/misc,/usr/share/fonts/X11/TTF,/usr/share/fonts/X11/OTF,/usr/share/fonts/X11/Type1,/usr/share/fonts/X11/100dpi,/usr/share/fonts/X11/75dpi \
	-Dxkb_dir=/usr/share/X11/xkb \
	-Dxkb_output_dir=/tmp/xkb \
	-Dxkb_default_rules=evdev \
	-Dxkb_default_model=pc105 \
	-Dxkb_default_layout=us \
	-Dlog_dir=/var/log \
	-Dmodule_dir=/usr/lib/xorg/modules \
	-Ddocs=false \
	-Ddevel-docs=false

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/xorg
	$(CP) $(PKG_INSTALL_DIR)/usr/include/xorg/*.h $(1)/usr/include/xorg/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/share/aclocal
	$(CP) $(PKG_INSTALL_DIR)/usr/share/aclocal/*.m4 $(1)/usr/share/aclocal/ 2>/dev/null || true
endef

define Package/xlibre/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/X $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/Xorg $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*.so* $(1)/usr/lib/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/xorg/modules
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/xorg/modules/* $(1)/usr/lib/xorg/modules/
	$(INSTALL_DIR) $(1)/usr/share/X11/xorg.conf.d
	$(CP) $(PKG_INSTALL_DIR)/usr/share/X11/xorg.conf.d/* $(1)/usr/share/X11/xorg.conf.d/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/var/log
endef

$(eval $(call BuildPackage,xlibre))
