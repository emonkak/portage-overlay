# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/gvim/gvim-7.2.442.ebuild,v 1.5 2010/08/01 18:24:41 armin76 Exp $

EAPI=3
inherit vim mercurial

DESCRIPTION="GUI version of the Vim text editor"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"
IUSE=""

EHG_PROJECT="vim"
EHG_REPO_URI="http://vim.googlecode.com/hg/"

S="${WORKDIR}/hg"
