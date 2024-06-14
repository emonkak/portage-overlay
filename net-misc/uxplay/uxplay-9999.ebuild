# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="AirPlay Unix mirroring server"
HOMEPAGE="https://github.com/FDH2/UxPlay"

EGIT_REPO_URI="https://github.com/FDH2/UxPlay.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="vaapi +X"

DEPEND="app-pda/libplist
	dev-libs/openssl
	media-libs/gstreamer
	net-dns/avahi[mdnsresponder-compat]
	X? ( x11-libs/libX11 )"
RDEPEND="${DEPEND}
	media-libs/gst-plugins-bad
	media-libs/gst-plugins-base
	media-libs/gst-plugins-good
	media-plugins/gst-plugins-libav
	vaapi? ( media-plugins/gst-plugins-vaapi )"
BDEPEND="virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
		-DNO_X11_DEPS=$(usex X OFF ON)
	)
	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}/${PN}"
	dodoc README.md
}
