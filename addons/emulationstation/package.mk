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

PKG_NAME="emulationstation"
PKG_VERSION="646bede"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/Aloshi/EmulationStation"
PKG_GIT_URL="https://github.com/RetroPie/EmulationStation"
PKG_GIT_BRANCH="master"
PKG_SECTION="emulator"

PKG_DEPENDS_TARGET="toolchain boost freetype curl alsa-lib SDL2 FreeImage eigen es-theme-simple-dark"
PKG_PRIORITY="optional"

PKG_SHORTDESC="A cross-platform graphical front-end for emulators with controller navigation."
PKG_LONGDESC=""

PKG_ADDON_NAME="emulationstation"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_IS_ADDON="yes"

configure_target() {
  export LDFLAGS="$LDFLAGS -ldl"	

  cmake -DCMAKE_TOOLCHAIN_FILE=$CMAKE_CONF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/themes

  cp -P  $PKG_BUILD/.install_pkg/usr/bin/emulationstation $ADDON_BUILD/$PKG_ADDON_ID/bin/emulationstation

  # FreeImage
  cp -P $(get_build_dir FreeImage)/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/lib

  # theme
  cp -RP $(get_build_dir es-theme-simple-dark)/.install_pkg/etc/emulationstation/themes/* $ADDON_BUILD/$PKG_ADDON_ID/themes/



}

