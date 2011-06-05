# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
MY_PN=${PN}

inherit ossim subversion cmake-utils

unset SRC_URI

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="=sci-geosciences/ossim_package_support-${PV}
net-misc/curl
dev-libs/expat"
RDEPEND="${DEPEND}"

#S=${WORKDIR}/${P}

src_unpack() {
	subversion_src_unpack $*
}

src_install() {
	#emake INST_LOCATION="${ED}usr" install
	dolib "${WORKDIR}"/libwms-1.8.10_p3_build/Gentoo/*

	insinto /usr/include/wms
	doins include/wms/*
}
