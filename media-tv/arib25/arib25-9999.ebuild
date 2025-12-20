# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="ARIB STD-B25 test implementation for understanding specs"
HOMEPAGE="https://github.com/stz2012/libarib25"
EGIT_REPO_URI="https://github.com/stz2012/libarib25"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	cmake_src_prepare
	rm "${S}/cmake/PostInstall.cmake" || die
}
