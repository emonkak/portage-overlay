# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A MySQL storage engine based on groonga, the full text search engine"
HOMEPAGE="http://mroonga.org/"
SRC_URI="http://packages.groonga.org/source/mroonga/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+mecab"

DEPEND="app-text/groonga
virtual/mysql
mecab? ( app-text/mecab )
"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

pkg_pretend() {
	if [ ! -d ${EPREFIX}/usr/src/mysql ]; then
		eerror "MySQL source does not exists"
		eerror "You must put it to ${EPREFIX}/usr/src/mysql"
	fi
}

src_configure() {
	econf \
		--with-mysql-source=${EPREFIX}/usr/src/mysql \
		--with-mysql-config=${EPREFIX}/usr/bin/mysql_config
}

src_install() {
	emake DESTDIR="${D}" install
}

pkg_postinst() {
	einfo
	elog "You need to execute following commands by MySQL client."
	elog
	elog "mysql> INSTALL PLUGIN mroonga SONAME 'ha_mroonga.so';"
	elog "mysql> CREATE FUNCTION last_insert_grn_id RETURNS INTEGER SONAME 'ha_mroonga.so';"
	elog "mysql> CREATE FUNCTION mroonga_snippet RETURNS STRING SONAME 'ha_mroonga.so';"
	elog "mysql> CREATE FUNCTION mroonga_command RETURNS STRING SONAME 'ha_mroonga.so';"
	einfo
}
