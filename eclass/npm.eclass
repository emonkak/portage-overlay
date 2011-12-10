# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: emon
# Purpose:
#

EXPORT_FUNCTIONS src_configure src_install

[ -z "$SRC_URI" ] && SRC_URI="http://registry.npmjs.org/${PN}/-/${P}.tgz"

DEPEND="${DEPEND} net-libs/nodejs"

npm_src_configure() {
	local prefix="${D%/}${EPREFIX}"
	npm config set datadir "${prefix}/usr/share"
	npm config set indodir "${prefix}/usr/share/info"
	npm config set localstatedir "${prefix}/var/lib"
	npm config set prefix "${prefix}/usr"
	npm config set mandir "${prefix}/usr/share/man"
	npm config set sysconfdir "${prefix}/etc"
	npm config list
}

npm_src_install() {
	npm install -g package || die
}
