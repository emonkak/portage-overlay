# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
#!/bin/sh

EAPI=8

inherit git-r3 linux-mod

DESCRIPTION="PT3 driver for Linux"
HOMEPAGE="https://github.com/m-tsudo/pt3"
EGIT_REPO_URI="https://github.com/m-tsudo/pt3"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

DEPEND="virtual/pkgconfig"
RDEPEND="${DEPEND} virtual/udev"

MODULE_NAMES="pt3_drv(kernel/drivers/video:${S}:${S})"
BUILD_TARGETS="all"

src_compile() {
	BUILD_PARAMS="KBUILD=${KV_OUT_DIR}"
	linux-mod_src_compile
}

src_install() {
	local udevdir="$(pkg-config --variable=udevdir udev)"
	insinto "${udevdir}"/rules.d
	doins etc/99-pt3.rules
	linux-mod_src_install
}
