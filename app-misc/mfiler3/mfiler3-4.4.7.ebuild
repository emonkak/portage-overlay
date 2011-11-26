# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

EAPI=3

DESCRIPTION="This program is a traditional Japanese style 2pain file manager
with a embedded shell scripting system \"saphire shell\"."
HOMEPAGE="http://ab25cq.web.fc2.com/"
SRC_URI="mirror://sourceforge.jp/${PN}/53899/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug migemo socket"
RESTRICT="mirror strip"

DEPEND="!app-misc/mfiler2
	app-shells/saphire
	dev-libs/boehm-gc
	dev-libs/oniguruma
	sys-libs/glibc
	sys-libs/ncurses
	sys-libs/readline
	migemo? ( app-text/cmigemo )"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e 's!%s/\(utf-8\|euc-jp\|cp932\)/migemo-dict!%s/migemo-dict!' \
	    -e 's!%s/\(utf-8\|euc-jp\|cp932\)/roma2hira.dat!%s/roma2hira.dat!' \
	    -e 's!%s/\(utf-8\|euc-jp\|cp932\)/hira2kata.dat!%s/hira2kata.dat!' \
	    -e 's!%s/\(utf-8\|euc-jp\|cp932\)/han2zen.dat!%s/han2zen.dat!' \
	    -i isearch.c || die "sed failed"
}

src_configure() {
	local myconf="--sysconfdir=/etc/mfiler3"
	use debug && myconf+=" --with-debug"
	use migemo && myconf+=" --with-migemo --with-system-migemodir=/usr/share/migemo"
	use socket && myconf+=" --with-socket"
	econf ${myconf} || die "econf failed"
}

src_compile() {
	sed -e 's/^CC=/CC?=/' \
	    -e 's/^CFLAGS=/CFLAGS+=/' \
	    -e '/^\tinstall -m 644 mfiler3\.sao/d' \
	    -i Makefile || die "sed failed"
	emake mfiler3 mattr || die "emake failed"
}

src_install() {
	einstall sysconfdir="${D}"/etc/mfiler3 || die "einstall failed"
}

pkg_postinst() {
	elog "You need to compile."
	elog "% saphire -c 'compile /etc/mfiler3/mfiler3.sa'"
}
