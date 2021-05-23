# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools

DESCRIPTION="Improved JPEG encoder based on libjpeg-turbo"
HOMEPAGE="https://github.com/mozilla/mozjpeg"
SRC_URI="https://github.com/mozilla/${PN}/archive/v${PV}.tar.gz"

LICENSE="BSD IJG"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-libs/zlib"
DEPEND="${RDEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}


src_configure() {
	econf --prefix="${EPREFIX}/opt/mozjpeg"
}

src_install() {
	emake DESTDIR="${D}" mandir="/opt/mozjpeg/share/man" install
	for f in cjpeg djpeg jpegtran rdjpgcom wrjpgcom
	do
		dosym "/opt/mozjpeg/bin/${f}" "/opt/bin/moz${f}"
		dosym "/opt/mozjpeg/share/man/man1/${f}.1" "/usr/share/man/man1/moz${f}.1"
	done
}
