# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
MY_PN=ossimPlanet

inherit ossim eutils flag-o-matic

DESCRIPTION="High performance software system for remote sensing, image processing, GIS and photogrammetry."
HOMEPAGE="http://www.ossim.org"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="predator ephemeris"

DEPEND="
=sci-geosciences/libwms-${PV}
=sci-geosciences/ossim-${PV}
dev-games/openscenegraph
ephemeris? ( dev-games/osgephemeris )
"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-optional-ephemeris.patch
}

src_compile() {
	myconf=""
	append-flags -fPIC
	if use predator
	then
		append-flags -DOSSIMPLANET_ENABLE_PREDATOR
	else
		myconf="${myconf} ENABLE_PREDATOR=no"
	fi
	if use ephemeris 
	then
		append-flags -DOSSIMPLANET_ENABLE_EPHEMERIS
	else
		myconf="${myconf} ENABLE_EPHEMERIS=no"
	fi

	# TODO submit proper libdir
	emake ${myconf} DEF="${CFLAGS}" INST_LOCATION=${EPREFIX}/usr
}

src_install() {
	emake INST_LOCATION="${ED}usr" install
}
