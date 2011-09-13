# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Foxit PDF Reader"
HOMEPAGE="http://www.foxitsoftware.com/pdf/desklinux/"
SRC_URI="http://mirrors.foxitsoftware.com/pub/foxit/reader/desktop/linux/1.x/1.1/enu/FoxitReader-1.1.0.tar.bz2"

LICENSE="Foxit Reader"
SLOT="0"
KEYWORDS="-* x86"
IUSE="cups"

RESTRICT="strip mirror"

DEPEND=""
RDEPEND="media-libs/fontconfig
	media-libs/freetype
	media-libs/libpng
	x11-libs/pango
	x11-libs/cairo
	dev-libs/expat
	cups? ( net-print/cups )
	x86? ( >=x11-libs/gtk+-2.0 )"

LANGS="ja de fr zh_CN zh_TW"
for x in ${LANGS}; do
	IUSE="${IUSE} linguas_${x}"
done

S="${WORKDIR}/1.1-release"

pkg_setup() {
	# This is a binary x86 package => ABI=x86
	has_multilib_profile && ABI="x86"
}

src_install() {
	dodir /opt/${PN}
	insinto /opt/${PN}
	doins fpdfcjk.bin fum.fhd Readme.txt || die "doins failed"

	insopts -m0755
	doins FoxitReader || die "doins failed"
	dosym /opt/${PN}/FoxitReader /usr/bin/foxitreader

	for x in ${LANGS}; do
		use linguas_${x} && (domo po/${x}/FoxitReader.mo || die "domo failed")
	done

	newicon ${FILESDIR}/${PN}.png ${PN}.png
	make_desktop_entry ${PN} FoxitReader ${PN}.png "Application;Office;Viewer;"
}
