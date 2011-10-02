# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit multilib

MY_P=${P/_/-}

DESCRIPTION="library for multi-thread programming with CML(Concurrent ML) style synchronous message passing communications"
HOMEPAGE="http://forge.ocamlcore.org/projects/ccell"
SRC_URI="http://forge.ocamlcore.org/frs/download.php/637/${MY_P}.tar.bz2"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-util/omake"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	sed -e "s|^INSTALL_DIR = /usr/local/lib/ocaml/ccell|INSTALL_DIR = \"${D}/usr/$(get_libdir)/ocaml\"|" \
	    -i OMakefile || die
}

src_compile() {
	omake --force-dotomake || die
}

src_install() {
	insinto "/usr/$(get_libdir)/ocaml/ccell"
	doins META
	omake --force-dotomake install || die
}
