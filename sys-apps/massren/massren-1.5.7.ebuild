# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/laurent22/${PN}"

inherit golang-build

DESCRIPTION="Easily rename multiple files using your text editor"
HOMEPAGE="https://github.com/laurent22/massren"
SRC_URI="https://github.com/laurent22/massren/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	dobin "${PN}"
	dodoc "README.md"
}
