# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs udev

MY_PV="$(ver_cut 1-2)-$(ver_cut 3)"

DESCRIPTION="The MPEG Transport Stream Toolkit"
HOMEPAGE="https://tsduck.io/"
SRC_URI="https://github.com/tsduck/tsduck/archive/v${MY_PV}.tar.gz -> ${PN}-v${MY_PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="+curl debug doc java +libedit rist +python smartcard srt +ssl test +zlib"

DEPEND="
	curl? ( net-misc/curl )
	java? ( virtual/jdk:= )
	libedit? ( dev-libs/libedit )
	rist? ( net-libs/librist )
	smartcard? ( sys-apps/pcsc-lite )
	srt? ( net-libs/srt )
	ssl? ( dev-libs/openssl:= )
	zlib? ( virtual/zlib:= )
	sys-kernel/linux-headers
"
RDEPEND="${DEPEND}"
BDEPEND="
	doc? ( dev-ruby/asciidoctor )
"

S="${WORKDIR}/${PN}-${MY_PV}"

src_prepare() {
	default
	sed -i -e '/^_EXCLUDES\s*=/s/$/ PORTAGE_%/' Makefile.inc || die
	sed -i -e "/^INSTALLDOC\s*=/s/$/-${PV}/" doc/Makefile || die
}

src_compile() {
	tc-export CXX LD
	MAKEOPTS+=" NODEKTEC=1"
	MAKEOPTS+=" NOGITHUB=1"
	MAKEOPTS+=" NOVATEK=1"
	use curl || MAKEOPTS+=" NOCURL=1"
	use debug && MAKEOPTS+=" DEBUG=1"
	use doc || MAKEOPTS+=" NODOC=1"
	use java || MAKEOPTS+=" NOJAVA=1"
	use libedit || MAKEOPTS+=" NOEDITLINE=1"
	use python || MAKEOPTS+=" NOPYTHON=1"
	use rist || MAKEOPTS+=" NORIST=1"
	use smartcard || MAKEOPTS+=" NOPCSC=1"
	use srt || MAKEOPTS+=" NOSRT=1"
	use ssl || MAKEOPTS+=" NOOPENSSL=1"
	use test || MAKEOPTS+=" NOTEST=1"
	use zlib || MAKEOPTS+=" NOZLIB=1"
	emake \
		ARFLAGS_EXTRA="${ARFLAGS}" \
		CXXFLAGS_EXTRA="${CXXFLAGS}" \
		LDFLAGS_EXTRA="${LDFLAGS}"
}

src_install() {
	use debug && MAKEOPTS+="DEBUG=1"
	emake \
		ETCDIR="${EPREFIX}/etc" \
		STRIP=true \
		SYSPREFIX="${EPREFIX}/usr" \
		SYSROOT="${D}" \
		UDEVDIR="${EPREFIX}/$(get_udevdir)/rules.d" \
		USRLIBDIR="${EPREFIX}/usr/$(get_libdir)" \
		install
}

src_test() {
	use test && emake test
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
