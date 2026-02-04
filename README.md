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

### libwacom Dependency

The `xf86-input-libinput` package depends on `libinput` from the OpenWrt packages feed. To avoid pulling in `glib` as a dependency (which would significantly increase the size), **libinput should be built with libwacom support disabled**.

When building the OpenWrt packages feed, ensure that `libinput` is configured with the `-Dlibwacom=false` meson option to prevent the glib dependency chain:
- libinput → libwacom → glib

This can be achieved by modifying the libinput package in the OpenWrt packages feed to include:
```makefile
MESON_ARGS += -Dlibwacom=false
```
