# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

MY_P=${P/./-}

DESCRIPTION="Permissive HTML parsing and emitting capability to Scheme programs"
HOMEPAGE="http://www.neilvandyke.org/htmlprag/"
SRC_URI="http://www.neilvandyke.org/htmlprag/${MY_P}.scm"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-scheme/gauche"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_prepare() {
	epatch "${FILESDIR}/${P}-gauche.patch" || die "epatch faild"
}

src_unpack() {
	cp "${DISTDIR}/${A}" . || die "cp faild"
}

src_install() {
	insinto /usr/share/gauche/site/lib
	newins ${A} ${PN}.scm || die "newins faild"
}
