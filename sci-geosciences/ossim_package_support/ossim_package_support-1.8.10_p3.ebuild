# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit subversion ossim

unset SRC_URI

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	# Install cmake stuff
	insinto /usr/share/cmake/Modules
	for file in cmake/CMakeModules/*
	do
		# The following files already come with cmake 2.8.4.
		[[ "${file}" == */FindFreetype.cmake ]] ||
			[[ "${file}" == */FindJPEG.cmake ]] ||
			[[ "${file}" == */FindZLIB.cmake ]] ||
			doins "${file}"
	done

	insinto /usr/share/ossim/geoid1996
	doins geoids/geoid1996/egm96.grd

	insinto /usr/share/ossim
	doins ossimbashrc

	insinto /usr/share/ossim/images
	doins images/*

	insinto /usr/share/ossim/images/reference
	doins images/reference/*

	docinto /usr/share/ossim-${PV}
	dodoc ossimPlanetUsers.pdf

	insinto /usr/share/icons/ossim
	doins icons/*
}
