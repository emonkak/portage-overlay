# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
#!/bin/sh


EAPI=6

inherit autotools eutils git-r3

DESCRIPTION=""
HOMEPAGE="https://github.com/stz2012/recpt1"
EGIT_REPO_URI="https://github.com/stz2012/recpt1"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc x86"
IUSE="+b25"

DEPEND="virtual/pkgconfig
        sys-apps/pcsc-lite
        b25? ( media-tv/arib25 )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/recpt1"

src_prepare() {
	eapply_user
	eaclocal
	eautoheader
	eautoconf
}

src_configure() {
	econf $(use_enable b25)
}

src_install() {
	mkdir -p ${D}/usr/bin
	emake DESTDIR="${D}" install
}
