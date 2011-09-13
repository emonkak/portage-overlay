# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"
# Not tested with Python 3.
RESTRICT_PYTHON_ABIS="3.*"
PYTHON_MODNAME="dbtexmf"

inherit distutils eutils

DESCRIPTION="Transform DocBook using TeX macros"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
HOMEPAGE="http://dblatex.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="( || ( app-text/texlive app-text/ptex ) )
	dev-libs/libxslt
	app-text/docbook-xml-dtd"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-ptex.patch" || die "failed epatch"
	distutils_src_prepare
}

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install
	dobin scripts/dblatex || die "failed dobin"
	mv "${D}"/usr/share/doc/${PN}/* "${D}"/usr/share/doc/${PF} || die "failed mv doc"
}
