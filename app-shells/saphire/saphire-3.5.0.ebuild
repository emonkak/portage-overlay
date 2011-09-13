# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic

EAPI=3

DESCRIPTION="A shell script language."
HOMEPAGE="http://ab25cq.web.fc2.com/"
SRC_URI="mirror://sourceforge.jp/sash/53064/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug gprof migemo"
RESTRICT="mirror strip"

DEPEND="dev-libs/boehm-gc
	dev-libs/oniguruma
	sys-libs/glibc
	sys-libs/ncurses
	sys-libs/readline
	gprof? ( sys-devel/binutils )
	migemo? ( app-text/cmigemo )"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e 's!%s/\(utf-8\|euc-jp\|cp932\)/migemo-dict!%s/migemo-dict!' \
	    -e 's!%s/\(utf-8\|euc-jp\|cp932\)/roma2hira.dat!%s/roma2hira.dat!' \
	    -e 's!%s/\(utf-8\|euc-jp\|cp932\)/hira2kata.dat!%s/hira2kata.dat!' \
	    -e 's!%s/\(utf-8\|euc-jp\|cp932\)/han2zen.dat!%s/han2zen.dat!' \
	    -i readline.c || die "sed failed"
}

src_configure() {
	local myconf="--sysconfdir=/etc/saphire"
	use debug && myconf+=" --with-debug"
	use gprof && myconf+=" --with-gprof-debug"
	use migemo && myconf+=" --with-migemo --with-system-migemodir=/usr/share/migemo"
	econf ${myconf} || die "econf failed"
}

src_compile() {
	sed -e 's/^CC=/CC?=/' \
	    -e 's/^CFLAGS=/CFLAGS+=/' \
	    -e '/^\t\$(INSTALL) -m 644 saphire\.sao/d' \
	    -i Makefile || die "sed failed"
	emake saphire saphiresh || die "emake failed"
}

src_install() {
	einstall sysconfdir="${D}/etc/saphire" || die "einstall failed"
}

pkg_postinst() {
	elog "You need to compile."
	elog "% saphire -rn -c 'compile /etc/saphire/saphire.sa'"
}
