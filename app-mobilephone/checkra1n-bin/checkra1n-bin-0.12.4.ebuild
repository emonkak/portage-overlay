# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Installs a pre-compiled checkra1n ELF in /opt/bin"
HOMEPAGE="https://checkra.in/"
SRC_URI="amd64? ( https://assets.checkra.in/downloads/linux/cli/x86_64/dac9968939ea6e6bfbdedeb41d7e2579c4711dc2c5083f91dced66ca397dc51d/checkra1n -> checkra1n.amd64 )
	x86? ( https://assets.checkra.in/downloads/linux/cli/i486/77779d897bf06021824de50f08497a76878c6d9e35db7a9c82545506ceae217e/checkra1n -> checkra1n.x86 )
	arm? ( https://assets.checkra.in/downloads/linux/cli/arm/ff05dfb32834c03b88346509aec5ca9916db98de3019adf4201a2a6efe31e9f5/checkra1n -> checkra1n.arm )
	arm64? ( https://assets.checkra.in/downloads/linux/cli/arm64/43019a573ab1c866fe88edb1f2dd5bb38b0caf135533ee0d6e3ed720256b89d0/checkra1n -> checkra1n.arm64 )"

LICENSE="all-rights-reserved"
RESTRICT="bindist mirror test strip"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	mkdir -p "${WORKDIR}/${P}"
}

src_install() {
	into /opt
	newbin ${DISTDIR}/${A} checkra1n
}
