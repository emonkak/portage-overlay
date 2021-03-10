# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8} )
inherit distutils-r1 git-r3

DESCRIPTION="LibRay aims to be a Libre (FLOSS) Python application for unencrypting, extracting, repackaging, and encrypting PS3 ISOs."
HOMEPAGE="https://notabug.org/necklace/libray"

EGIT_REPO_URI="https://notabug.org/necklace/libray.git"
if [[ ${PV} != 9999 ]]; then
	EGIT_COMMIT="${PV}"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="
	dev-python/beautifulsoup:4
	dev-python/pycryptodome
	dev-python/requests
	dev-python/tqdm
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
