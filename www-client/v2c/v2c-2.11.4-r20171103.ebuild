# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
#!/bin/sh

EAPI=6

inherit eutils java-pkg-opt-2

MY_JAR="V2C_R${PR/r/}"

DESCRIPTION="A 2channel and Twitter browser that made from Java+Swing"
HOMEPAGE="http://v2c.s50.xrea.com"
SRC_URI="http://v2c.s50.xrea.com/V2C_${PV}.tar.gz
https://cldup.com/qxm37De6Y5.gz -> ${MY_JAR}.pack.gz"

LICENSE="Custom"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}
virtual/jdk"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
	${JAVA_HOME}/bin/unpack200 ${MY_JAR}.pack ${S}/launcher/${MY_JAR}.jar || die "unpack200 failed"
	cd "${S}"
}

src_prepare() {
	eapply_user
	sed -e "s|v2cargs.txt|/tmp/v2cargs.txt|" \
	    -e "s|v2clog.txt|/tmp/v2clog.txt|" \
	    -i v2c || die "sed failed"
}

src_install() {
	insinto "/opt/${PN}"
	doins v2c
	insinto "/opt/${PN}/launcher"
	doins launcher/${MY_JAR}.jar
	doins ${FILESDIR}/v2crc
	dosym "/opt/${PN}/v2c" "/opt/bin/${PN}"
	fperms +x "/opt/${PN}/v2c"
	make_desktop_entry "v2c" "V2C" "${PN}" "Network"
	newicon v2cicon.png ${PN}.png
}
