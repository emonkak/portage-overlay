# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/gtkvncviewer/gtkvncviewer-0.4.ebuild,v 1.2 2012/09/05 08:07:06 jlec Exp $

EAPI=4
PYTHON_DEPEND="2"

inherit eutils fdo-mime python

DESCRIPTION="A small GTK tool to connect to VNC servers"
HOMEPAGE="https://launchpad.net/gtkvncviewer"
SRC_URI="https://launchpad.net/${PN}/trunk/0.4/+download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/gconf-python:2
	dev-python/gnome-keyring-python
	dev-python/pygtk:2
	net-libs/gtk-vnc[python]"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -i -e '130 s/gnomekeyring.DeniedError/(gnomekeyring.DeniedError, gnomekeyring.BadArgumentsError,gnomekeyring.IOError)/' gtkvncviewer.py || die
}

src_install() {
	dodir /usr/share/gtkvncviewer
	domenu data/gtkvncviewer.desktop
	rm -f data/gtkvncviewer.desktop
	insinto /usr/share/gtkvncviewer
	doins -r locale data gtkvncviewer.py
	doman gtkvncviewer.1
	dodoc AUTHORS CHANGELOG TODO
	make_wrapper gtkvncviewer "/usr/bin/python2 ${PN}.py" "/usr/share/${PN}"
	validate_desktop_entries
}

pkg_postinst() { fdo-mime_desktop_database_update; }
pkg_postrm() { fdo-mime_desktop_database_update; }