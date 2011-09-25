# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit linux-info

DESCRIPTION="Madotukai no Yuutu for Linux"
HOMEPAGE="http://www42.tok2.com/home/negidakude/"
SRC_URI="http://www42.tok2.com/home/negidakude/downdata/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=" dev-libs/libusb
	dev-libs/boost
	sys-fs/udev"
DEPEND="${RDEPEND}"

pkg_setup() {
	if ! linux_config_exists; then
		eerror "Unable to check your kernel for uinput support"
	elif ! linux_chkconfig_present INPUT_UINPUT; then
		eerror "You have to enable CONFIG_INPUT_UINPUT in the kernel"
		eerror "to have uninput support."
	fi
}

src_install() {
	einstall
	newinitd "${FILESDIR}/mayu.initd" mayu || die
	dodoc ChangeLog INSTALL README || die
}
