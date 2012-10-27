# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-input-evdev/xf86-input-evdev-2.7.0.ebuild,v 1.3 2012/03/19 22:27:23 chithanh Exp $

EAPI=4
inherit xorg-2

DESCRIPTION="Generic Linux input driver"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~sh ~sparc ~x86"
IUSE=""

RDEPEND=">=x11-base/xorg-server-1.11.99.901
	sys-libs/mtdev"
DEPEND="${RDEPEND}
	>=x11-proto/inputproto-2.1.99.3
	>=sys-kernel/linux-headers-2.6"

PATCHES=(
	"${FILESDIR}/${PN}-2.6.0-expert-mouse.patch"
)
