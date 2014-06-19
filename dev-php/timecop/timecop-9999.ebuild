# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#!/bin/sh

EAPI=5
PHP_EXT_NAME="timecop"
USE_PHP="php5-3 php5-4 php5-5"

inherit git-2 php-ext-source-r2

DESCRIPTION='A PHP extension providing "time travel" capabilities inspired by ruby timecop gem'
HOMEPAGE="https://github.com/hnw/php-timecop"
SRC_URI=""

EGIT_REPO_URI="https://github.com/hnw/php-timecop.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack

	for slot in $(php_get_slots); do
		cp -r "${S}" "${WORKDIR}/${slot}"
	done
}
