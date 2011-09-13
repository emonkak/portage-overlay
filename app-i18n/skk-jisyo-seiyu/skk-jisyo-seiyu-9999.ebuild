# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Jisyo (dictionary) files for the SKK Japanese-input software"
HOMEPAGE="http://tomoch.s28.xrea.com/"
SRC_URI=""

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~sparc ~x86"
IUSE="cdb"

DEPEND="sys-libs/glibc
	sys-apps/gawk
	cdb? ( dev-db/cdb )"

src_unpack() {
	wget -q "http://tomoch.s28.xrea.com/ime.cgi" -O - | awk '
		BEGIN {
			print ";; okuri-ari entries."
			print ";; okuri-nasi entries."
		}
		/^<pre>/ {
			sub("<pre>","",$1)
			print $1 " /" $2 "/"
		}
		  /^[^<]/ {
			print $1 " /" $2 "/"
		}
	' ${A} | iconv -f UTF-8 -t EUC-JP-MS > SKK-JISYO.seiyu || die
}

src_compile() {
	# bug 184457
	unset LANG LC_ALL LC_CTYPE

	if use cdb ; then
		awk '
			/^[^;]/ {
				s = substr($0, index($0, " ") + 1)
				print "+" length($1) "," length(s) ":" $1 "->" s
			}
			END {
				print ""
			}
		' SKK-JISYO.seiyu | cdbmake SKK-JISYO.seiyu.cdb "${T}"/SKK-JISYO.seiyu || die
	fi
}

src_install() {
	# install dictionaries
	insinto /usr/share/skk
	doins SKK-JISYO.* || die
}
