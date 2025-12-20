# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module pam systemd

EGO_SUM=(
	"github.com/msteinert/pam/v2 v2.0.0 h1:jnObb8MT6jvMbmrUQO5J/puTUjxy7Av+55zVJRJsCyE="
	"github.com/msteinert/pam/v2 v2.0.0/go.mod h1:KT28NNIcDFf3PcBmNI2mIGO4zZJ+9RSs/At2PB3IDVc="
	"golang.org/x/sys v0.6.0 h1:MVltZSvRTcU2ljQOhs94SXPftV6DCNnZViHeQps87pQ="
	"golang.org/x/sys v0.6.0/go.mod h1:oPkhp1MJrh7nUepCBck5+mAzfO9JrbApNNgaTdGDITg="
	"golang.org/x/term v0.6.0 h1:clScbb1cHjoCkyRbWwBEUZ5H/tIFu5TAXIqaZD0Gcjw="
	"golang.org/x/term v0.6.0/go.mod h1:m6U89DPEgQRMq3DNkDClhWw02AUbt2daBVO4cn4Hv9U="
)

go-module_set_globals

DESCRIPTION="Dead simple CLI Display Manager on TTY"
HOMEPAGE="https://github.com/tvrzna/emptty"
SRC_URI="https://github.com/tvrzna/emptty/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="primaryuri"
DEPEND="sys-libs/pam
	x11-libs/libX11"
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.20"

src_compile() {
	ego build
}

src_install() {
	dobin ${PN}
	dodoc README.md SAMPLES.md
	doman res/${PN}.1

	insinto /etc/${PN}
	doins res/conf

	exeinto /etc/init.d
	newexe res/openrc-service ${PN}

	newpamd res/pam ${PN}
	systemd_newunit res/systemd-service ${PN}.service
}
