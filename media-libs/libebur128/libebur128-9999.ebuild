# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#!/bin/sh

EAPI=5

inherit cmake-utils git-2

DESCRIPTION="A library implementing the EBU R128 loudness standard"
HOMEPAGE="https://github.com/jiixyj/libebur128"
SRC_URI=""

EGIT_REPO_URI="https://github.com/jiixyj/libebur128.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
