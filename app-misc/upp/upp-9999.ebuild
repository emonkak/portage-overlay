# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8} )
inherit distutils-r1 git-r3

DESCRIPTION="Uplift Power Play"
HOMEPAGE="https://github.com/sibradzic/upp"

EGIT_REPO_URI="https://github.com/sibradzic/upp.git"
if [[ ${PV} != 9999 ]]; then
	EGIT_COMMIT="v${PV}"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/click
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
