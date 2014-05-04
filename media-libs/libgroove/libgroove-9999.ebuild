# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#!/bin/sh

EAPI=5

inherit cmake-utils git-2

DESCRIPTION="Audio dispatching library"
HOMEPAGE="https://github.com/andrewrk/libgroove"
SRC_URI=""

EGIT_REPO_URI="https://github.com/andrewrk/libgroove.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/chromaprint
media-libs/libebur128
media-libs/libsdl2
>=media-video/libav-10"
RDEPEND="${DEPEND}"
