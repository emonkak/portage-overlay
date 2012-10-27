# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: emon
# Purpose:
#

EXPORT_FUNCTIONS src_configure src_install src_unpack

[ -z "$SRC_URI" ] && SRC_URI="http://registry.npmjs.org/${PN}/-/${P}.tgz"

DEPEND="${DEPEND} net-libs/nodejs"

npm_src_unpack() {
	return
}

npm_src_configure() {
	npm config set datadir "${ED}/usr/share"
	npm config set indodir "${ED}/usr/share/info"
	npm config set localstatedir "${ED}/var/lib"
	npm config set prefix "${ED}/usr"
	npm config set mandir "${ED}/usr/share/man"
	npm config set sysconfdir "${ED}/etc"
	npm config list
}

npm_src_install() {
	npm install -g "${DISTDIR}/${A}" || die
}
