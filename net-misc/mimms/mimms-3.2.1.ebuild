# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="An mms:// downloader client"
HOMEPAGE="https://savannah.nongnu.org/projects/mimms/"
SRC_URI="https://download.savannah.gnu.org/releases/mimms/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="media-libs/libmms"
RDEPEND="${DEPEND}"

src_install() {
	make DESTDIR="${D}" install || die "einstall failed"
	dodoc AUTHORS COPYING README || die "dodoc failed"
}
