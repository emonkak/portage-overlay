# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Convert TrueType fonts to BDF fonts"
HOMEPAGE="http://www1.kaoriya.net/"
SRC_URI="http://www1.kaoriya.net/dist/${P}.tar.bz2"

LICENSE="bdf2ttf"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	 emake gcc || die
}

src_install() {
	exeinto "${EPREFIX}/usr/share/bdf2ttf"
	doexe bdf2ttf || die
	insinto "${EPREFIX}/usr/share/bdf2ttf"
	doins -r ucstable.d || die
	dosym ../share/bdf2ttf/bdf2ttf "${EPREFIX}/usr/bin/bdf2ttf" || die
	dodoc README_j.txt CHANGE_j.txt || die
}
