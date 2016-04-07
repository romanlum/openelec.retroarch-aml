################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="tools.retroarch"
PKG_VERSION=""
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="free as freedom"
PKG_SITE="https://github.com/libretro/Lakka"
PKG_URL=""
PKG_DEPENDS_TARGET="retroarch retroarch-assets common-shaders core-info retroarch-joypad-autoconfig snes9x-next genesis-plus-gx mupen64plus"
PKG_PRIORITY="optional"
PKG_SECTION="emulator"
PKG_SHORTDESC="Retroarch addon."
PKG_LONGDESC="Retroarch addon."
PKG_DISCLAIMER="this is an unofficial addon. please don't ask for support in openelec forum / irc channel"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="RetroArch"
PKG_ADDON_TYPE="xbmc.python.script"

PKG_AUTORECONF="no"

addon() {
  # Hack: install retroarch with dependencies first, then clean install stamps and install retroarch + cores to addon dir
  scripts/install retroarch

  for i in $PKG_DEPENDS_TARGET; do
    rm -rf $STAMPS_INSTALL/$i
    INSTALL="$ADDON_BUILD/$PKG_ADDON_ID" scripts/install $i
  done

  mkdir -p  $ADDON_BUILD/$PKG_ADDON_ID/config/joypad_autoconfig/
  mkdir -p  $ADDON_BUILD/$PKG_ADDON_ID/assets
  mkdir -p  $ADDON_BUILD/$PKG_ADDON_ID/shaders

  cp -PR $ADDON_BUILD/$PKG_ADDON_ID/etc/retroarch-joypad-autoconfig/* $ADDON_BUILD/$PKG_ADDON_ID/config/joypad_autoconfig/
  cp -PR $ADDON_BUILD/$PKG_ADDON_ID/usr/share/retroarch-assets/* $ADDON_BUILD/$PKG_ADDON_ID/assets/
  cp -PR $ADDON_BUILD/$PKG_ADDON_ID/usr/share/common-shaders/* $ADDON_BUILD/$PKG_ADDON_ID/shaders/

  # Copy and cleanup
  cp -PR $ADDON_BUILD/$PKG_ADDON_ID/usr/lib/udev/rules.d $ADDON_BUILD/$PKG_ADDON_ID/udev.d
  rm -rf $ADDON_BUILD/$PKG_ADDON_ID/usr/lib/systemd
  rm -rf $ADDON_BUILD/$PKG_ADDON_ID/usr/lib/tmpfiles.d
  rm -rf $ADDON_BUILD/$PKG_ADDON_ID/usr/lib/udev
  cp -PR $ADDON_BUILD/$PKG_ADDON_ID/usr/lib $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -PR $ADDON_BUILD/$PKG_ADDON_ID/usr/bin $ADDON_BUILD/$PKG_ADDON_ID/bin
  rm -rf $ADDON_BUILD/$PKG_ADDON_ID/etc
  rm -rf $ADDON_BUILD/$PKG_ADDON_ID/usr
}

makeinstall_target() {
  : # nop
}

make_target() {
  : # nop
}
