# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: Dirk Tilger <dirk.github@miriup.de>
# Purpose: Have all common functionalities of ossim building in one place.
#

inherit versionator

DESCRIPTION="High performance software system for remote sensing, image processing, GIS and photogrammetry."
HOMEPAGE="http://www.ossim.org"
SRC_URI="http://download.osgeo.org/ossim/src/ossim-${PV}.tgz"
LICENSE="LGPL-2.1"

MY_PV=$(get_version_component_range 1-3)
PATCHLEVEL=$(get_version_component_range 4)
if [[ "x${PATCHLEVEL}" == xp* ]]
then
	MY_PV="${MY_PV}-${PATCHLEVEL#p}"
fi

ESVN_REPO_URI="https://svn.osgeo.org/ossim/tags/ossim-${MY_PV}/${MY_PN:-${PN}}"

