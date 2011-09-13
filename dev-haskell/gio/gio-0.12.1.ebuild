# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.13

EAPI="3"

CABAL_FEATURES="lib profile haddock hscolour"
inherit haskell-cabal

DESCRIPTION="Binding to the GIO."
HOMEPAGE="http://projects.haskell.org/gtk2hs/"
SRC_URI="http://code.haskell.org/~duncan/gtk2hs/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/glib-0.12.0
		<dev-haskell/glib-0.13
		dev-haskell/mtl
		>=dev-lang/ghc-6.10.1
		>=dev-libs/glib-2.16.4"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		dev-haskell/gtk2hs-buildtools"
