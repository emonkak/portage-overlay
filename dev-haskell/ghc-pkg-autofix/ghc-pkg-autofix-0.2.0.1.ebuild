# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3

CABAL_FEATURES="bin"
inherit haskell-cabal

DESCRIPTION="Simple utility to fix BROKEN package dependencies for cabal-install."
HOMEPAGE="http://hackage.haskell.org/package/ghc-pkg-autofix"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		<dev-haskell/cabal-2
		=dev-haskell/cmdargs-0.9*
		=dev-haskell/parsec-3*
		=dev-haskell/split-0.1*
		>=dev-lang/ghc-6.10.4"