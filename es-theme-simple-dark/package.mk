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

PKG_NAME="es-theme-simple-dark"
PKG_VERSION="baa0905"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/RetroPie/es-theme-simple-dark.git"
PKG_GIT_URL="https://github.com/RetroPie/es-theme-simple-dark.git"
PKG_GIT_BRANCH="master"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="emulators"
PKG_SHORTDESC="Simple dark theme for Emulationstation"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL/etc/emulationstation/themes/simple-dark
  cp -r * $INSTALL/etc/emulationstation/themes/simple-dark
}
