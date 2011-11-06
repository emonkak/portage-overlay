# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.13

EAPI="3"

CABAL_FEATURES="bin"
inherit haskell-cabal git-2

DESCRIPTION="Happy Haskell programming on Emacs"
HOMEPAGE="http://www.mew.org/~kazu/proj/ghc-mod/"
EGIT_REPO_URI="git://github.com/kazu-yamamoto/ghc-mod.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
		dev-haskell/attoparsec
		dev-haskell/attoparsec-enumerator
		>=dev-haskell/cabal-1.6
		dev-haskell/enumerator
		dev-haskell/ghc-paths
		>=dev-haskell/hlint-1.7.1
		dev-haskell/transformers
		>=dev-lang/ghc-6.10.1"
