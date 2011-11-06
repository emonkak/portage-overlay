# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit autotools eutils git-2

DESCRIPTION="Turn Vim script into a programmable programming language"
HOMEPAGE="https://github.com/kana/vim-xire"
SRC_URI=""
EGIT_REPO_URI='git://github.com/kana/vim-xire.git'

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+doc"

DEPEND=">=dev-scheme/gauche-0.9
	 doc? (
	 	app-text/asciidoc
	 	dev-ruby/rake
	 )"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-fix-makefile.patch"
	eautoconf
}

src_install() {
	einstall || die
	dobin "bin/xirec" || die
	if use doc; then
		rake README.html || die
		dohtml README.html || die
	fi
}
