# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
inherit eutils

DESCRIPTION="This program is a traditional Japanese style 2pain file manager
with a embedded shell scripting system \"saphire shell\"."
HOMEPAGE="http://ab25cq.web.fc2.com/"
SRC_URI="mirror://sourceforge.jp/${PN}/54457/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~x64-macos ~x86-macos"
IUSE="debug migemo socket"
RESTRICT="mirror strip"

DEPEND="!app-misc/mfiler2
	app-shells/saphire
	dev-libs/oniguruma
	!prefix? ( sys-libs/glibc )
	sys-libs/ncurses
	sys-libs/readline
	migemo? ( app-text/cmigemo )"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed \
		-e 's!^CC=!CC?=!' \
		-e "s!^CFLAGS=@CFLAGS@\$!CFLAGS+=-I${EPREFIX}/usr/include -L${EPREFIX}/usr/$(eval echo \$LIBDIR_${ABI}) -I .!" \
		-e 's!^LIBS=@LIBS@$!& -ltinfo!' \
		-e 's!^\(\t$(CC) -o mattr mattr.c\) -lcurses$!\1 -lncurses -ltinfo $(CFLAGS)!' \
		-e 's!^docdir=@docdir@mfiler3$!docdir=@docdir@!' \
		-e 's!install -s!install!' \
		-i Makefile.in || die "sed failed"
	sed \
		-e 's!%s/\(utf-8\|euc-jp\|cp932\)/\(migemo-dict\|roma2hira.dat\|hira2kata.dat\|han2zen.dat\)!%s/\2!' \
		-i isearch.c || die "sed failed"
}

src_configure() {
	local myconf=""
	use debug && myconf+=" --with-debug"
	use migemo && myconf+=" --with-migemo --with-system-migemodir=${EPREFIX}/usr/share/migemo"
	use socket && myconf+=" --with-socket"
	econf ${myconf}
}

src_install() {
	emake DESTDIR="${ED}" dest-install
}
