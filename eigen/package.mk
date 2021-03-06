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

PKG_NAME="eigen"
PKG_VERSION="3.2.8"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="http://eigen.tuxfamily.org/"
PKG_URL="http://bitbucket.org/eigen/eigen/get/$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SHORTDESC="C++ template library"
PKG_LONGDESC="Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."

PKG_IS_ADDON="no"

unpack() {
  tar xjf $ROOT/$SOURCES/$PKG_NAME/$PKG_VERSION.tar.bz2 -C $ROOT/$BUILD
  mv $ROOT/$BUILD/eigen-eigen-07105f7124f9 $ROOT/$BUILD/$PKG_NAME-$PKG_VERSION
}


configure_target() {
  cmake -DCMAKE_TOOLCHAIN_FILE=$CMAKE_CONF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
}


