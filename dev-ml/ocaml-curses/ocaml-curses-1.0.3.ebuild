# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit autotools findlib

DESCRIPTION="OCaml Curses is a project to provide curses / ncurses bindings for the Objective Caml language"
HOMEPAGE="http://www.nongnu.org/ocaml-tmk/"
SRC_URI="http://download.savannah.gnu.org/releases/ocaml-tmk/${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+ocamlopt"

DEPEND="dev-lang/ocaml"
RDEPEND="${DEPEND}"

src_prepare() {
	echo "#define HAVE_SYS_IOCTL_H" > config.h.in
	eautoconf || die
}

src_install() {
	emake || die
	use ocamlopt && emake opt || die
}

src_install() {
	findlib_src_preinst
	einstall || die
}
