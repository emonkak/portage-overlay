# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.13

EAPI="3"

CABAL_FEATURES="lib profile haddock hscolour"
inherit haskell-cabal

DESCRIPTION="Small but solid library for
functional reactive programming (FRP)."
HOMEPAGE="http://haskell.org/haskellwiki/Reactive-banana"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/mtl
		=dev-haskell/quickcheck-2.4*
		=dev-haskell/transformers-0.2*
		>=dev-lang/ghc-7.0.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"

src_prepare() {
	sed -i \
		-e 's/base >= 4\.2 && < 4\.4/base >= 4.2/' \
		-e 's/monads-tf == 0\.1\.\*/mtl/' \
		"${S}/${PN}.cabal" || die
}
