# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.14

EAPI="3"

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Fast JSON parsing and encoding"
HOMEPAGE="https://github.com/bos/aeson"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/attoparsec-0.8.6.1
		>=dev-haskell/blaze-builder-0.2.1.4
		dev-haskell/deepseq
		>=dev-haskell/hashable-1.1.2.0
		dev-haskell/mtl
		>=dev-haskell/text-0.11.0.2
		dev-haskell/time
		>=dev-haskell/unordered-containers-0.1.3.0
		>=dev-haskell/vector-0.7.1
		>=dev-lang/ghc-6.12.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8"
