# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 linux-mod-r1

DESCRIPTION="PT3 driver for Linux"
HOMEPAGE="https://github.com/m-tsudo/pt3"
EGIT_REPO_URI="https://github.com/m-tsudo/pt3"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/pkgconfig"
RDEPEND="${DEPEND} virtual/udev"

src_compile() {
	local modlist=( pt3_drv=kernel/drivers/video:${S}:${S}:all )
	local modargs=( KBUILD=${KV_OUT_DIR} )
	linux-mod-r1_src_compile
}

src_install() {
	local udevdir="$(pkg-config --variable=udevdir udev)"
	insinto "${udevdir}"/rules.d
	doins etc/99-pt3.rules
	linux-mod-r1_src_install
}
