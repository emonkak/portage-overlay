# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="npm is a package manager for node"
HOMEPAGE="http://npmjs.org/"
SRC_URI="http://registry.npmjs.org/npm/-/${P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/package

src_configure() {
	local prefix="${D%/}${EPREFIX}"
	./configure \
		--datadir="${prefix}"/usr/share \
		--infodir="${prefix}"/usr/share/info \
		--localstatedir="${prefix}"/var/lib \
		--prefix="${prefix}"/usr \
		--mandir="${prefix}"/usr/share/man \
		--sysconfdir="${prefix}"/etc || die
}

src_install() {
	make install || die
	dodoc AUTHORS CHANGES LICENSE README.md || die
}
