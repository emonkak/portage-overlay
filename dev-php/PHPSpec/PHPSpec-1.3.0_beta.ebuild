# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

PHP_PEAR_CHANNEL="${FILESDIR}/channel.xml"
PHP_PEAR_PN="${PN}"

inherit php-pear-lib-r1

PHP_PEAR_P="${P/_/}"

DESCRIPTION="The first PHP BDD Framework"
SRC_URI="http://pear.phpspec.net/get/${PHP_PEAR_P}.tgz"

LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86"

RDEPEND="${DEPEND}
	dev-php/Text_Template
	dev-php/mockery"

S="${WORKDIR}/${PHP_PEAR_P}"
