# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit git

EGIT_REPO_URI="git://repo.or.cz/fast-export.git"

DESCRIPTION="Programs to feed git-fast-import"
HOMEPAGE="http://repo.or.cz/w/fast-export.git"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/apr
	dev-vcs/git
	dev-vcs/mercurial
	dev-vcs/subversion"
RDEPEND="${DEPEND}"

src_prepare() {
	git_src_prepare
	sed -i \
		-e 's/^CFLAGS += \(.*\)/CFLAGS := \1 $(CFLAGS)/' \
		-e 's/^LDFLAGS += \(.*\)/LDFLAGS := \1 $(LDFLAGS)/' \
	"${S}/Makefile" || die
}

src_compile() {
	emake SVN="${EPREFIX}/usr" APR_INCLUDES="${EPREFIX}/usr/include/apr-1" || die
}

src_install() {
	dobin "${FILESDIR}/git-hg" svn-archive svn-fast-export || die
	exeinto "${EPREFIX}/usr/libexec/${PN}"
	doexe hg-fast-export.py hg-fast-export.sh hg-reset.py hg-reset.sh
	for f in hg-fast-export hg-reset; do
		dosym "../libexec/${PN}/${f}.sh" "${EPREFIX}/usr/bin/${f}" || die
	done
	dodoc hg-fast-export.txt || die
}
