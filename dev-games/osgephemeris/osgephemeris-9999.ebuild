# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
MY_PN=osgEphemeris

inherit subversion cmake-utils

DESCRIPTION="osgEphemeris provides the virtual environment for the sky, sun, moon, planets and stars to be used with visualization applications using  OpenSceneGraph"
HOMEPAGE="http://andesengineering.com/Projects/OsgEphemeris/"
#SRC_URI=""
ESVN_REPO_URI="https://www.andesengineering.com/svn/${MY_PN}/trunk/${MY_PN}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	subversion_src_unpack $*
}
