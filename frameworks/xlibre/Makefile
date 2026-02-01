include $(TOPDIR)/rules.mk

PKG_NAME:=xlibre
PKG_VERSION:=25.1.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/X11Libre/xserver.git
PKG_SOURCE_VERSION:=xlibre-xserver-$(PKG_VERSION)
PKG_MIRROR_HASH:=skip

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
  DEPENDS:=+libdrm +libepoxy +libmesa +libpciaccess +libseat +libx11 +libxau \
	+libxcb +libxcvt +libxdmcp +libxext +libxfixes +libxfont2 +libxkbfile \
	+libxshmfence +pixman +seatd +xkeyboard-config
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
	-Dglamor=true \
	-Dglx=true \
	-Dglx_dri=true \
	-Ddri1=false \
	-Ddri2=true \
	-Ddri3=true \
	-Ddrm=true \
	-Dudev=true \
	-Dudev_kms=true \
	-Dhal=false \
	-Dsystemd_logind=false \
	-Dsystemd_notify=false \
	-Dseatd_libseat=true \
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
	-Dsecure-rpc=false \
	-Dxf86bigfont=false \
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
