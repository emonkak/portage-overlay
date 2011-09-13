# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="A XML-RPC library for Gauche"
HOMEPAGE="http://www.cozmixng.org/~rwiki/?cmd=view;name=xsm"
SRC_URI="http://www.cozmixng.org/~kou/download/${P}.tar.gz"

LICENSE="|| ( GPL-2 BSD )"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-scheme/gauche"
RDEPEND="${DEPEND}"

src_install() {
	dodir /usr/share/gauche/site
	cp -r lib "${D}/usr/share/gauche/site" || die "cp faild"
	dodoc README.en README.ja || die "dodoc faild"
}
