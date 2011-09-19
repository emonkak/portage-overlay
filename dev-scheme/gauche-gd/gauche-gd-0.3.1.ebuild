# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="An extension package of Gauche which provides a binding of Thomas Boutell's GD2 library"
HOMEPAGE="http://fixedpoint.jp/gauche-gd/"
SRC_URI="http://fixedpoint.jp/gauche-gd/Gauche-gd-${PV}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-scheme/gauche-0.8.7
	>=media-libs/gd-2.0.28"
RDEPEND="${DEPEND}"

S="${WORKDIR}/Gauche-gd-${PV}"

src_install() {
	emake DESTDIR="${D}" install || die
}
