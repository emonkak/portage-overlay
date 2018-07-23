# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#!/bin/sh

EAPI=6

EGO_PN="github.com/laurent22/${PN}"

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Easily rename multiple files using your text editor"
HOMEPAGE="https://github.com/laurent22/massren"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

src_install() {
	dobin "${PN}"
	dodoc "src/${EGO_PN}/README.md"
}
