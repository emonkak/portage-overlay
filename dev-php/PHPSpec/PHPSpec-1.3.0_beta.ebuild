# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/twig/twig-1.0.0.ebuild,v 1.2 2011/04/16 12:32:46 olemarkus Exp $

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
