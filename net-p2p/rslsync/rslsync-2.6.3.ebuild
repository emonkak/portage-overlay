# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#!/bin/sh


EAPI=6

DESCRIPTION="All your data, across all your devices"
HOMEPAGE="https://www.resilio.com/individuals/"
SRC_URI="amd64? ( https://download-cdn.resilio.com/${PV}/linux-x64/resilio-sync_x64.tar.gz -> resilio-sync-${PV}_x64.tar.gz )
x86? ( https://download-cdn.resilio.com/${PV}/linux-i386/resilio-sync_i386.tar.gz -> resilio-sync-${PV}_x64.tar.gz )"

RESTRICT="mirror strip"
LICENSE="BitTorrent"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	dobin rslsync
}
