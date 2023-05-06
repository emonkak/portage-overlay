# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="A shell script language."
HOMEPAGE="http://ab25cq.web.fc2.com/"
SRC_URI="mirror://sourceforge.jp/sash/54458/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~x64-macos ~x86-macos"
IUSE="debug gprof migemo"
RESTRICT="mirror strip"

DEPEND="dev-libs/oniguruma
	!prefix? ( sys-libs/glibc )
	sys-libs/ncurses
	sys-libs/readline
	gprof? ( sys-devel/binutils )
	migemo? ( app-text/cmigemo )"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed \
		-e 's/^CC=/CC?=/' \
		-e 's/^CFLAGS=/CFLAGS+=/' \
		-e 's!^\tgcc -shared -o libsaphire\.so\.2\.0\.0!& -Wl,-soname=libsaphire.so.2!' \
		-e 's!^docdir=@datadir@/doc/saphire$!docdir=@docdir@!' \
		-e 's!\$(INSTALL) -s!$(INSTALL)!' \
		-e 's!\$(INSTALL) -m 644 -s!$(INSTALL) -m 664!' \
		-i Makefile.in || die "sed failed"
	sed \
		-e 's!%s/\(utf-8\|euc-jp\|cp932\)/\(migemo-dict\|roma2hira.dat\|hira2kata.dat\|han2zen.dat\)!%s/\2!' \
		-i src/readline.c || die "sed failed"
	sed \
		-e 's!^fInternalCommand kInternalCommands\[kCommand\];$!extern &!' \
		-i headers/saphire/saphire_inner.h || die "sed failed"
}

src_configure() {
	local myconf=""
	use debug && myconf+=" --with-debug"
	use gprof && myconf+=" --with-gprof-debug"
	use migemo && myconf+=" --with-migemo --with-system-migemodir=${EPREFIX}/usr/share/migemo"
	econf $myconf
}

src_install() {
	emake DESTDIR="${ED}" dest-install lib-dest-install
}
