# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#!/bin/sh


EAPI=6
PHP_EXT_NAME="ast"
USE_PHP="php7-0 php7-1 php7-2 php7-3"

inherit git-r3 php-ext-source-r3

DESCRIPTION="Extension exposing PHP 7 abstract syntax tree"
HOMEPAGE="https://github.com/nikic/php-ast"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nikic/php-ast.git"
EGIT_COMMIT="v${PV}"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack
	php-ext-source-r3_src_unpack
}
