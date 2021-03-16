# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
#!/bin/sh

EAPI=6

inherit qmake-utils git-r3

DESCRIPTION="Nico Nama Comment Viewer"
HOMEPAGE="https://github.com/diginatu/Viqo"
EGIT_REPO_URI="https://github.com/diginatu/Viqo.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-libs/openssl
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork
	dev-qt/qtsql:5
	sys-libs/glibc"
RDEPEND="${DEPEND}"

src_configure() {
	eqmake5 PREFIX="/usr"
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
