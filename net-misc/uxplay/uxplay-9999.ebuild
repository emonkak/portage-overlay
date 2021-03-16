# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3

DESCRIPTION="AirPlay Unix mirroring server"
HOMEPAGE="https://github.com/antimof/UxPlay"

EGIT_REPO_URI="https://github.com/antimof/UxPlay.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="media-libs/gst-plugins-base
	media-libs/gstreamer
	media-plugins/gst-plugins-libav
	net-dns/avahi"
RDEPEND="${DEPEND}
	media-libs/gst-plugins-bad
	media-libs/gst-plugins-good"
BDEPEND=""

src_install() {
	dobin "${BUILD_DIR}/${PN}"
	dodoc README.md
}
