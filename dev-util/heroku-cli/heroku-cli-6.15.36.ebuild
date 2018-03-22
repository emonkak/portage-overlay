# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A tool for creating and managing Heroku apps from the command line"
HOMEPAGE="https://devcenter.heroku.com/articles/heroku-cli"

HEROKU_HASH="7adf289"
BASE_URI="https://cli-assets.heroku.com/${PN}/channels/stable"
SRC_URI="
	x86? ( ${BASE_URI}/${PN}-v${PV}-${HEROKU_HASH}-linux-x86.tar.gz )
	amd64? ( ${BASE_URI}/${PN}-v${PV}-${HEROKU_HASH}-linux-x64.tar.gz )
"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"

pkg_setup() {
	use amd64 && ARCH="x64"
	use x86 && ARCH="x86"
	S="${WORKDIR}/${PN}-v${PV}-${HEROKU_HASH}-linux-${ARCH}"
}

src_install() {
	insinto /opt/${PN}
	doins -r *
	fperms +x /opt/${PN}/bin/${PN//-cli}
	fperms +x /opt/${PN}/bin/node
	dosym /opt/${PN}/bin/${PN//-cli} /usr/bin/${PN//-cli}
}
