# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit python

DESCRIPTION="An mms:// downloader client"
HOMEPAGE="https://savannah.nongnu.org/projects/mimms/"
SRC_URI="http://download.savannah.gnu.org/releases-noredirect/mimms/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

python_dep=">=dev-lang/python-2.5
            <dev-lang/python-3.0"
DEPEND="media-libs/libmms"
RDEPEND="${DEPEND}"

src_install() {
	make DESTDIR="${D}" install || die "einstall failed"
	dodoc AUTHORS COPYING README || die "dodoc failed"
}
