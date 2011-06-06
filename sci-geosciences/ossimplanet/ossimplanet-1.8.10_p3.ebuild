# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
MY_PN=ossimPlanet

inherit ossim subversion eutils flag-o-matic cmake-utils

unset SRC_URI

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="predator ephemeris"

DEPEND="=sci-geosciences/ossim_package_support-${PV}
=sci-geosciences/libwms-${PV}
=sci-geosciences/ossim-${PV}
dev-games/openscenegraph
ephemeris? ( dev-games/osgephemeris )
virtual/opengl
"
RDEPEND="${DEPEND}"

src_unpack() {
	subversion_src_unpack $*
}

#src_prepare() {
#	epatch "${FILESDIR}"/${PN}-1.8.4-optional-ephemeris.patch
#}

src_configure() {
	mycmakeargs=(
	)
	use predator && mycmakeargs+=(-DBUILD_OSSIMPREDATOR:BOOL=ON) ||
		mycmakeargs+=(-DBUILD_OSSIMPREDATOR:BOOL=OFF)
	use ephemeris && mycmakeargs+=(-DOSSIMPLANET_ENABLE_EPHEMERIS:BOOL=ON) ||
		mycmakeargs+=(-DOSSIMPLANET_ENABLE_EPHEMERIS:BOOL=OFF)
	cmake-utils_src_configure
}

#src_compile() {
#	myconf=""
#	append-flags -fPIC
#	if use predator
#	then
#		append-flags -DOSSIMPLANET_ENABLE_PREDATOR
#	else
#		myconf="${myconf} ENABLE_PREDATOR=no"
#	fi
#	if use ephemeris 
#	then
#		append-flags -DOSSIMPLANET_ENABLE_EPHEMERIS
#	else
#		myconf="${myconf} ENABLE_EPHEMERIS=no"
#	fi
#
#	cmake-utils_src_compile $*
#}

src_install() {
	cd ${S}_build
	emake DESTDIR="${ED}" install
}
