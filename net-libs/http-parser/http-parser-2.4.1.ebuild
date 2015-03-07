# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/http-parser/http-parser-2.3.ebuild,v 1.6 2014/10/12 08:55:19 ago Exp $

EAPI=5

inherit eutils toolchain-funcs multilib multilib-minimal

DESCRIPTION="http request/response parser for c"
HOMEPAGE="https://github.com/joyent/http-parser"
SRC_URI="https://github.com/joyent/http-parser/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="amd64 ~arm ~ppc x86"
IUSE="static-libs"

src_prepare() {
	sed -i  -e 's: -Werror::' \
		-e 's:-O3 ::' \
		Makefile || die
	tc-export CC AR
	multilib_copy_sources
}

multilib_src_compile() {
	emake SONAME="libhttp_parser$(get_libname).${PV}" library
	use static-libs && emake package
}

multilib_src_install() {
	SONAME="libhttp_parser$(get_libname).${PV}"
	doheader http_parser.h
	dolib.so ${SONAME}
	dosym ${SONAME} /usr/$(get_libdir)/libhttp_parser$(get_libname)
	use static-libs && dolib.a libhttp_parser.a
}

multilib_src_install_all() {
	dodoc README.md
}
