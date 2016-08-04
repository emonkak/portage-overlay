# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#!/bin/sh

EAPI=5

DESCRIPTION="Zephir is a compiled high level language aimed to the creation of C-extensions for PHP"
HOMEPAGE="http://zephir-lang.com/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/phalcon/zephir.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
|| ( >=sys-devel/gcc-4.0 >=sys-devel/clang-3.0 )
>=dev-util/re2c-0.13
>=sys-devel/autoconf-2.31
>=sys-devel/automake-1.14
>=sys-devel/make-3.81
dev-libs/libpcre
"
RDEPEND="${DEPEND}"

src_compile() {
	./install-json
	./install
}

src_install() {
	sed "s#%ZEPHIRDIR%#$ZEPHIRDIR#g" bin/zephir
	dobin bin/zephir
}
