# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Madotukai no Yuutu for Linux"
HOMEPAGE="http://members.at.infoseek.co.jp/hattoushin_uma/"
SRC_URI="http://members.at.infoseek.co.jp/hattoushin_uma/cgi-bin/download/download.cgi/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-libs/boost-1.33"
DEPEND="${RDEPEND}"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	einstall || die "einstall failed"

	newinitd "${FILESDIR}"/mayu.initd mayu || die
	dodoc ChangeLog INSTALL README || die "dodoc failed"
}
