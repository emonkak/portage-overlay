# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MY_P=${P/g/G}

DESCRIPTION="Gauche bindings for GNU Readline"
HOMEPAGE="http://www.netlab.is.tsukuba.ac.jp/~yokota/izumi/gauche/"
SRC_URI="http://www.netlab.is.tsukuba.ac.jp/~yokota/archive/${MY_P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-scheme/gauche"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_install() {
	einstall || die "einstall failed"
}
