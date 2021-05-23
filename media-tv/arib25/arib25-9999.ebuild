# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit cmake-multilib git-r3

DESCRIPTION="ARIB STD-B25 test implementation for understanding specs"
HOMEPAGE="https://github.com/stz2012/libarib25"
EGIT_REPO_URI="https://github.com/stz2012/libarib25"

LICENSE=""
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	cmake-utils_src_prepare

	rm -v "${S}/cmake/PostInstall.cmake" || die
}
