# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PHP_EXT_NAME="ast"
USE_PHP="php7-2 php7-3 php7-4 php8-0 php8-1 php8-2 php8-3 php8-4 php8-5"

inherit git-r3 php-ext-source-r3

DESCRIPTION="Extension exposing PHP 7 abstract syntax tree"
HOMEPAGE="https://github.com/nikic/php-ast"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nikic/php-ast.git"
EGIT_COMMIT="v${PV}"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack
	php-ext-source-r3_src_unpack
}
