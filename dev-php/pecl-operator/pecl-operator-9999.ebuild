# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/pecl-memcached/pecl-memcached-2.1.0-r2.ebuild,v 1.2 2013/04/01 20:50:15 swegener Exp $

EAPI="4"
PHP_EXT_NAME="operator"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

USE_PHP="php5-4 php5-3"

inherit php-ext-pecl-r2 git-r3

S="${WORKDIR}/${P}"

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Operator overloading for Objects"
LICENSE="PHP-3"
SLOT="0"
SRC_URI=""
EGIT_REPO_URI="https://git.php.net/repository/pecl/php/operator.git"
