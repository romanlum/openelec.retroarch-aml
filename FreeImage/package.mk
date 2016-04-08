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

PKG_NAME="FreeImage"
PKG_VERSION="3170"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="http://freeimage.sourceforge.net"
PKG_URL="https://sourceforge.net/projects/freeimage/files/Source%20Distribution/3.17.0/$PKG_NAME$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SHORTDESC="Open Source library project for developers who would like to support popular graphics image formats"
PKG_LONGDESC="FreeImage is an Open Source library project for developers who would like to support popular graphics image formats like PNG, BMP, JPEG, TIFF and others as needed by today's multimedia applications. FreeImage is easy to use, fast, multithreading safe, compatible with all 32-bit or 64-bit versions of Windows, and cross-platform (works both with Linux and Mac OS X)."
PKG_IS_ADDON="no"

unpack() {
  unzip $ROOT/$SOURCES/FreeImage/$PKG_NAME$PKG_VERSION -d $ROOT/$BUILD
  mv $ROOT/$BUILD/FreeImage $ROOT/$BUILD/$PKG_NAME-$PKG_VERSION
}

