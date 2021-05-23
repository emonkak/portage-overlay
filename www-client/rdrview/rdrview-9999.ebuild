# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#!/bin/sh

EAPI=7

inherit git-r3

DESCRIPTION="Firefox Reader View as a command line tool"
HOMEPAGE="https://github.com/eafer/rdrview"

EGIT_REPO_URI="https://github.com/eafer/rdrview"

LICENSE="Apache License 2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/libxml2
	sys-libs/libseccomp
	net-misc/curl"
RDEPEND="${DEPEND}
	www-client/lynx"
BDEPEND=""

src_prepare() {
	eapply_user
	sed -i -e "/^PREFIX\s*=/ s|/usr/local|${EPREFIX}/usr|" Makefile || die
}
