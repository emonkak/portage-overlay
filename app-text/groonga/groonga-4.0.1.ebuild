# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Open-source fulltext search engine and column store."
HOMEPAGE="http://groonga.org/"
SRC_URI="http://packages.groonga.org/source/groonga/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libedit lzo mecab msgpack munin +zlib"

DEPEND="libedit? ( dev-libs/libedit )
lzo? ( dev-libs/lzo )
mecab? ( app-text/mecab )
munin? ( net-analyzer/munin )
msgpack? ( dev-libs/msgpack )
zlib? ( sys-libs/zlib )"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

src_configure() {
	econf \
		$(use_with lzo) \
		$(use_with mecab) \
		$(use_with munin) \
		$(use_with msgpack message-pack ${EPREFIX}/usr) \
		$(use_with zlib)
}

src_install() {
	emake DESTDIR="${D}" install
}
