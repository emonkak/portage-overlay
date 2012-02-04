# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#!/bin/sh

EAPI=4

MY_PV=${PV/_p/-}

DESCRIPTION="Notion is a tiling, tabbed window manager for the X window system"
HOMEPAGE="http://notion.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-${MY_PV}-src.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/lua"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MY_PV}"

src_prepare() {
	sed -e "s|^PREFIX=.*|PREFIX=${EPREFIX}/usr|" \
	    -e "s|^ETCDIR=.*|ETCDIR=${EPREFIX}/etc/notion|" \
	    -i "${S}/system.mk" || die
}
