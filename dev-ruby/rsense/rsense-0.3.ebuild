# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit elisp-common

DESCRIPTION="Ruby development tools"
HOMEPAGE="http://cx4a.org/software/rsense/"
SRC_URI="http://cx4a.org/pub/rsense/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+vim-syntax emacs"

DEPEND=""
RDEPEND="${DEPEND}
	>=virtual/jre-1.5
	dev-lang/ruby
	vim-syntax? ( app-editors/vim )
	emacs? ( virtual/emacs )"

src_install() {
	dodir /opt/rsense
	cp -r * "${D}/opt/rsense" || die
	chmod +x "${D}/opt/rsense/bin/rsense" || die
	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles/plugin
		doins etc/rsense.vim || die
	fi
	if use emacs; then
		elisp-install etc/rsense.el
	fi
}

