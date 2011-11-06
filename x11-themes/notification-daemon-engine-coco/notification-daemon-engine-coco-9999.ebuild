# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit git-2

EGIT_REPO_URI="git://github.com/egrajeda/notification-daemon-engine-coco.git"
EGIT_BOOTSTRAP="autogen.sh"

DESCRIPTION="NotifyOSD inspired theme engine for the notification daemon"
HOMEPAGE="https://github.com/tatofoo/notification-daemon-engine-coco"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-devel/autoconf
	sys-devel/automake
	sys-devel/libtool
	x11-libs/cairo
	x11-libs/gtk+:2"
RDEPEND="${DEPEND}
x11-misc/notification-daemon"

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS COPYING ChangeLog Credits INSTALL NEWS README.mkd || die
}

