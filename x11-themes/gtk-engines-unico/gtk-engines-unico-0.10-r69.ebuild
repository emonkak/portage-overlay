# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit bzr

DESCRIPTION="The Unico Gtk+ Theming Engine"
HOMEPAGE="https://launchpad.net/unico"
SRC_URI=""

EBZR_BOOTSTRAP="autogen.sh"
EBZR_PROJECT="unico"
EBZR_REPO_URI="lp:unico"
EBZR_REVISION="${PR:1}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-libs/glib-2.26
	>=dev-util/intltool-0.40
	>=dev-util/pkgconfig-0.16
	>=sys-devel/autoconf-2.63
	>=sys-devel/automake-1.9
	>=x11-libs/cairo-1.10
	>=x11-libs/gtk+-3.0.8:3
	gnome-base/gnome-common"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc AUTHORS ChangeLog COPYING INSTALL NEWS README TODO || die "dodoc failed"
}
