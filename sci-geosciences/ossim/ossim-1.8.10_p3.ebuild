# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit ossim subversion cmake-utils

DESCRIPTION="High performance software system for remote sensing, image processing, GIS and photogrammetry."
HOMEPAGE="http://www.ossim.org"
unset SRC_URI

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="tiff mpi freetype"

DEPEND="
tiff? ( media-libs/tiff )
virtual/jpeg
sci-libs/libgeotiff
mpi? ( virtual/mpi )
dev-games/openscenegraph
freetype? ( media-libs/freetype )
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}/${PN}

src_unpack() {
	subversion_src_unpack $*
}

src_configure() {
	econf \
		$(use_with tiff tiff "${EPREFIX}/usr" ) \
		--with-jpeg="${EPREFIX}/usr" \
		--with-geotiff="${EPREFIX}/usr" \
		$(use_with mpi mpi "${EPREFIX}/usr" ) \
		--with-openthreads="${EPREFIX}/usr" \
		$(use_with freetype freetype "${EPREFIX}/usr" )
}

src_install() {
	emake install DESTDIR="${D}"
}
