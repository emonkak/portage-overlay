# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font git-r3

DESCRIPTION="A set of modified artwiz fonts based on artwiz-aleczapka and artwiz-latin1"
HOMEPAGE="https://github.com/whitelynx/artwiz-fonts-wl"
EGIT_REPO_URI="https://github.com/whitelynx/artwiz-fonts-wl.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS="AUTHORS CHANGELOG COPYING README.md VERSION"
FONT_SUFFIX="bdf"
