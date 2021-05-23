# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
#!/bin/sh


EAPI=6

inherit autotools eutils git-r3

DESCRIPTION=""
HOMEPAGE="https://github.com/stz2012/recpt1"
SRC_URI="softcas? ( http://www.wazoku.net/softcas.zip )"
EGIT_REPO_URI="https://github.com/stz2012/recpt1"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="+b25 +softcas"

DEPEND="virtual/pkgconfig
        sys-apps/pcsc-lite
        b25? ( media-tv/arib25 )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/recpt1"

src_unpack() {
	if use softcas; then
		unpack softcas.zip
	fi
	git-r3_src_unpack
}

src_prepare() {
	eapply_user
	eaclocal
	eautoheader
	eautoconf
}

src_configure() {
	econf $(use_enable b25)
}

src_compile() {
	if use softcas; then
		pushd ${WORKDIR}/softcas
		cp -v ${FILESDIR}/softcas/* . || die
		sed -i -e 's|//\(const char \*Name;\)|\1|' Keyset.h || die
		emake
		popd
	fi
	emake
}


src_install() {
	mkdir -p ${D}/opt/${PN}/bin
	emake DESTDIR="${D}/opt/${PN}" prefix= install
	if use softcas; then
		into /opt
		dobin ${FILESDIR}/recpt1
		into /opt/${PN}
		dolib ${WORKDIR}/softcas/libpcsclite.so.1.0.0
		dosym /opt/${PN}/lib64 /opt/${PN}/lib
		for f in checksignal recpt1ctl; do
			dosym /opt/${PN}/bin/${f} /opt/bin/${f}
		done
	else
		for f in checksignal recpt1 recpt1ctl; do
			dosym /opt/${PN}/bin/${f} /opt/bin/${f}
		done
	fi
}
