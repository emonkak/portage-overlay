# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# This ebuild generated by g-cpan 0.16.4

EAPI="2"

MODULE_AUTHOR="MIYAGAWA"


inherit perl-module

DESCRIPTION="Web Scraping Toolkit using HTML and CSS Selectors or XPath expressions"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="perl-gcpan/HTML-TreeBuilder-XPath
	dev-perl/Test-Requires
	dev-perl/Test-Base
	dev-perl/URI
	>=dev-perl/XML-XPathEngine-0.12
	dev-perl/HTML-Tree
	dev-perl/HTML-Parser
	>=perl-gcpan/HTML-Selector-XPath-0.07
	dev-perl/HTML-Tagset
	dev-perl/UNIVERSAL-require
	dev-lang/perl"
