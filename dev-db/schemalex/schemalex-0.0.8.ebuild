# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#!/bin/sh

EAPI=6

EGO_PN="github.com/schemalex/${PN}"

if [[ ${PV} == 9999 ]]; then
	inherit golang-build golang-vcs
else
	inherit golang-build golang-vcs-snapshot
	SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Generate difference sql of two mysql schema"
HOMEPAGE="https://github.com/schemalex/schemalex"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-go/glide"
RDEPEND="${DEPEND}"

src_compile() {
	pushd "src/${EGO_PN}"
	GOPATH="${S}" glide install
	GOPATH="${S}" emake build
	popd
}

src_test() {
	GOPATH="${S}" emake -C "src/${EGO_PN}" test
}

src_install() {
	version=$(grep 'const Version' "src/${EGO_PN}/schemalex.go" | grep -o 'v[0-9.]\+')
	dobin "src/${EGO_PN}/artifacts/${version}/${PN}_$(go env GOOS)_$(go env GOARCH)/${PN}"
	dodoc "src/${EGO_PN}/"{Changes,LICENSE,README.md}
}
