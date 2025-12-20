# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Improved JPEG encoder based on libjpeg-turbo"
HOMEPAGE="https://github.com/mozilla/mozjpeg"
SRC_URI="https://github.com/mozilla/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD IJG"
SLOT="0"
KEYWORDS="~amd64"
IUSE="png"

RDEPEND="
	sys-libs/zlib
	png? ( >=media-libs/libpng-1.6:0= )
"
DEPEND="${RDEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs
	mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}/opt/mozjpeg"
		-DCMAKE_INSTALL_MANDIR="${EPREFIX}/opt/mozjpeg/share/man"
		-DPNG_SUPPORTED=$(usex png TRUE FALSE)
		-DENABLE_STATIC=FALSE
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
	for f in cjpeg djpeg jpegtran rdjpgcom tjbench wrjpgcom
	do
		dosym "/opt/mozjpeg/bin/${f}" "/opt/bin/moz${f}"
	done
	for f in cjpeg djpeg jpegtran rdjpgcom wrjpgcom
	do
		dosym "/opt/mozjpeg/share/man/man1/${f}.1" "/usr/share/man/man1/moz${f}.1"
	done
	dodoc README-mozilla.txt README-turbo.txt README.ijg README.md usage.txt wizard.txt
}
