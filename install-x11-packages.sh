#!/bin/sh
# OpenWrt Video Feed X11 Packages Installer
# This script installs all X11 packages from the distribution archive

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PACKAGE_DIR="${SCRIPT_DIR}/packages"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() {
    echo "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo "${RED}[ERROR]${NC} $1"
}

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    log_error "This script must be run as root"
    exit 1
fi

# Check if package directory exists
if [ ! -d "$PACKAGE_DIR" ]; then
    log_error "Package directory not found: $PACKAGE_DIR"
    log_info "Expected structure:"
    log_info "  $(dirname "$SCRIPT_DIR")/"
    log_info "    ├── install-x11-packages.sh (this script)"
    log_info "    └── packages/"
    log_info "        └── <arch>/"
    log_info "            └── video/"
    log_info "                └── *.ipk"
    exit 1
fi

# Detect architecture
ARCH=$(opkg print-architecture | awk '{print $2}' | head -n 1)
log_info "Detected architecture: $ARCH"

# Find the correct architecture package directory
ARCH_PACKAGE_DIR=""
for dir in "$PACKAGE_DIR"/*; do
    if [ -d "$dir" ]; then
        arch_name=$(basename "$dir")
        if [ "$arch_name" = "$ARCH" ] || [ "$arch_name" = "all" ]; then
            ARCH_PACKAGE_DIR="$dir"
            break
        fi
    fi
done

# If exact match not found, try to find any available architecture
if [ -z "$ARCH_PACKAGE_DIR" ]; then
    ARCH_PACKAGE_DIR=$(find "$PACKAGE_DIR" -mindepth 1 -maxdepth 1 -type d | head -n 1)
fi

if [ -z "$ARCH_PACKAGE_DIR" ] || [ ! -d "$ARCH_PACKAGE_DIR" ]; then
    log_error "No package directory found for architecture: $ARCH"
    log_info "Available architectures:"
    find "$PACKAGE_DIR" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;
    exit 1
fi

log_info "Using package directory: $ARCH_PACKAGE_DIR"

# Find video feed directory
VIDEO_FEED_DIR=""
if [ -d "$ARCH_PACKAGE_DIR/video" ]; then
    VIDEO_FEED_DIR="$ARCH_PACKAGE_DIR/video"
elif [ -d "$ARCH_PACKAGE_DIR" ]; then
    # If no video subdirectory, use the arch directory directly
    VIDEO_FEED_DIR="$ARCH_PACKAGE_DIR"
fi

if [ -z "$VIDEO_FEED_DIR" ] || [ ! -d "$VIDEO_FEED_DIR" ]; then
    log_error "Video feed directory not found"
    exit 1
fi

# Count available packages
PACKAGE_COUNT=$(find "$VIDEO_FEED_DIR" -name "*.ipk" -type f 2>/dev/null | wc -l)
if [ "$PACKAGE_COUNT" -eq 0 ]; then
    log_error "No .ipk packages found in $VIDEO_FEED_DIR"
    exit 1
fi

log_info "Found $PACKAGE_COUNT packages to install"

# Add local feed to opkg configuration
log_info "Configuring local package feed..."
FEED_CONF="/etc/opkg/customfeeds.conf"
if ! grep -q "src/gz video_local file://$VIDEO_FEED_DIR" "$FEED_CONF" 2>/dev/null; then
    echo "src/gz video_local file://$VIDEO_FEED_DIR" >> "$FEED_CONF"
    log_info "Added local video feed to $FEED_CONF"
fi

# Update package lists
log_info "Updating package lists..."
opkg update

# Install packages in dependency order
log_info "Installing X11 packages..."

# Helper function to install packages if they exist
install_if_exists() {
    local package=$1
    if opkg list | grep -q "^${package} "; then
        log_info "Installing $package..."
        opkg install "$package" || log_warn "Failed to install $package (may already be installed)"
    else
        log_warn "Package $package not available in feed"
    fi
}

# Install in dependency order (same order as CI build)
log_info "Installing X11 protocol and build infrastructure..."
install_if_exists xorgproto
install_if_exists xorg-macros
install_if_exists libxtrans
install_if_exists xcb-proto

log_info "Installing X11 authentication libraries..."
install_if_exists libxau
install_if_exists libxdmcp

log_info "Installing XCB and X11 libraries..."
install_if_exists libxcb
install_if_exists libx11

log_info "Installing X11 extension libraries..."
install_if_exists libxext
install_if_exists libxfixes
install_if_exists libxrender
install_if_exists libxrandr
install_if_exists libxi
install_if_exists libxinerama
install_if_exists libxshmfence

log_info "Installing X11 session libraries..."
install_if_exists libice
install_if_exists libsm

log_info "Installing X11 toolkit libraries..."
install_if_exists libxt
install_if_exists libxmu
install_if_exists libxpm
install_if_exists libxaw

log_info "Installing X11 font and misc libraries..."
install_if_exists libxfont2
install_if_exists libxkbfile
install_if_exists libxft
install_if_exists libpciaccess
install_if_exists libxcvt

log_info "Installing XLibre X server..."
install_if_exists xlibre

log_info "Installing X11 input drivers..."
install_if_exists xf86-input-evdev
install_if_exists xf86-input-libinput

log_info "Installing X11 video drivers..."
install_if_exists xf86-video-fbdev
install_if_exists xf86-video-vesa

log_info "Installing X11 utilities..."
install_if_exists xkbcomp
install_if_exists xauth
install_if_exists xinit
install_if_exists xrandr
install_if_exists xterm

log_info "${GREEN}Installation complete!${NC}"
log_info "You can now start the X server with: xinit"
