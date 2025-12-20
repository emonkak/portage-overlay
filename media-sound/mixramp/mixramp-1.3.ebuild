# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A utility to analyse sound files"
HOMEPAGE="https://sourceforge.net/projects/mixramp/"
SRC_URI="https://master.dl.sourceforge.net/project/mixramp/mixramp_${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+flac +mp3 ogg"

DEPEND="media-libs/audiofile"
RDEPEND="
	${DEPEND}
	flac? (
		media-libs/flac
	)
	mp3? (
		media-sound/mpg123
		dev-python/eyed3
	)
	ogg? ( media-sound/vorbis-tools )
"
BDEPEND=""

S="${WORKDIR}/${PN}"

PATCHES=(
	"${FILESDIR}/01-without-werror.patch"
	"${FILESDIR}/02-fix-eyed3-args.patch"
	"${FILESDIR}/03-ogg-support.patch"
	"${FILESDIR}/04-oggcomments-overwrite-policy.patch"
)

src_install() {
	dobin mixramp mixramp-tag
	dodoc README COPYING
}
