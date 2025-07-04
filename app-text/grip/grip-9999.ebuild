# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Preview GitHub Markdown files like Readme locally before committing them"
HOMEPAGE="https://github.com/joeyespo/grip"
LICENSE="MIT"
if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/joeyespo/grip.git"
else
	inherit pypi
fi

SLOT="0"

KEYWORDS="amd64"

RDEPEND="
	!media-sound/grip
	>=dev-python/docopt-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/flask-0.10.1[${PYTHON_USEDEP}]
	>=dev-python/markdown-2.5.1[${PYTHON_USEDEP}]
	>=dev-python/path-and-address-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/pygments-1.6[${PYTHON_USEDEP}]
	>=dev-python/requests-2.4.1[${PYTHON_USEDEP}]
"
