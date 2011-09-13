# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="FX Print Driver for Linux"
HOMEPAGE="http://www.fujixerox.co.jp/download/apeosport/download/c4300series/linux_module.html"
SRC_URI="http://download.fujixerox.co.jp/pub/exe/apeosport/c4300series/${PN}-src-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="net-print/cups"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-src-${PV}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -e "s|^\(cupsfilterdir = \).\+|\1${D}/usr/libexec/cups/filter|" \
	    -e "s|^\(cupsppddir = \)\(.\+\)|\1${D}\2|" \
	    -e "s|^\(cupsmimedir = \)\(.\+\)|\1${D}\2|" \
	    -i Makefile.in || die "sed failed"
}

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	einstall || die "einstall failed"
	dodoc AUTHORS INSTALL || die "dodoc failed"
}
