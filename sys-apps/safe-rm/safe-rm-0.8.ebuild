# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="preventing the accidental deletion of important files"
HOMEPAGE="https://launchpad.net/safe-rm"
SRC_URI="http://launchpad.net/safe-rm/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/perl
	${DEPEND}"

src_install() {
	dodoc Changes COPYING INSTALL README
	dobin safe-rm
}

