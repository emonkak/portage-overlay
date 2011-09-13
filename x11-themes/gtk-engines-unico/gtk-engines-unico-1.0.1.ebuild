# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="The Unico Gtk+ Theming Engine"
HOMEPAGE="https://launchpad.net/unico"
SRC_URI="http://launchpad.net/unico/${PV:0:3}/${PV}/+download/unico-${PV}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-libs/glib-2.26
	>=x11-libs/gtk+-3.1.10:3
	>=x11-libs/cairo-1.10
	dev-util/intltool
	dev-util/pkgconfig
	sys-devel/autoconf
	sys-devel/automake
	gnome-base/gnome-common"
RDEPEND="${DEPEND}"

S="${WORKDIR}/unico-${PV}"

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc AUTHORS ChangeLog COPYING INSTALL NEWS README TODO || die "dodoc failed"
}
