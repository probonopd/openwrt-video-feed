# Video packages feed

## Description

This is an OpenWrt package feed containing video / graphics (as in 'higher than just curses') related libraries and applications which are not considered to be so called "core" packages.

## Usage

To use these packages, add the following line to the feeds.conf
in the OpenWrt buildroot:

```
src-git video https://github.com/openwrt/video.git
```

This feed should be included and enabled by default in the OpenWrt buildroot. To install all its package definitions, run:

```
./scripts/feeds update video
./scripts/feeds install -a -p video
```

The video packages should now appear in menuconfig in section 'Video'.

## Important Notes

### XLibre X Server

This feed uses **XLibre** instead of the traditional X.Org server. XLibre is a fork of X.Org Server that maintains backward compatibility while cleaning up and strengthening the code base.

All X11 driver packages (xf86-input-*, xf86-video-*) in this feed are built against the **XLibre ABI**, not the Xorg ABI. This is ensured through the `PKG_BUILD_DEPENDS:=xlibre xorgproto` declaration in their Makefiles.

### Avoiding glib Dependency

This feed includes its own **libinput** package built without libwacom support to prevent the glib dependency chain (libinput → libwacom → glib). The locally-built libinput is configured with:
- `-Dlibwacom=false` - Disables tablet support requiring libwacom (and glib)
- `-Ddebug-gui=false` - Disables debug GUI requiring gtk/cairo (and glib)

This ensures that installing X11 packages from this feed will not pull in glib, significantly reducing the dependency footprint.
