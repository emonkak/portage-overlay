# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gnome2 git

EGIT_REPO_URI="git://git.tuxfamily.org/gitroot/ccm/cairocompmgr.git"
EGIT_BOOTSTRAP="autoreconf --force --install --verbose && intltoolize --copy --force --automake"

DESCRIPTION="A versatile and extensible compositing manager which uses cairo for rendering"
HOMEPAGE="http://cairo-compmgr.tuxfamily.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libSM
	>=x11-libs/cairo-1.8.0
	>=x11-libs/pixman-0.1.6.0
	>=x11-libs/gtk+-2.16.0:2
	dev-lang/vala:0.12"
DEPEND="${RDEPEND}
	gnome-base/gsettings-desktop-schemas
	>=x11-proto/glproto-1.4.9"

src_prepare() {
	sed -e 's|vala-0\.10|libvala-0.12|' \
		-i configure.ac vapi/cairo-compmgr.deps || die

	git_src_prepare
}

src_compile() {
	find . -name 'Makefile' -exec \
		sed -e 's|^VALAC = $|\0valac-0.12|' -i "{}" \; || die
	emake -j1 || die
}
