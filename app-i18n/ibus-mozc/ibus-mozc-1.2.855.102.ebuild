# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-i18n/ibus-mozc/ibus-mozc-1.2.855.102.ebuild,v 1.1 2011/10/04 00:05:49 matsuu Exp $

EAPI="3"
PYTHON_DEPEND="2"
inherit elisp-common eutils multilib python toolchain-funcs

PROTOBUF_PV="2.4.1"

MY_P="${P/ibus-}"
DESCRIPTION="The Mozc engine for IBus Framework"
HOMEPAGE="http://code.google.com/p/mozc/"
SRC_URI="http://mozc.googlecode.com/files/${MY_P}.tar.bz2
	uim? ( http://protobuf.googlecode.com/files/protobuf-${PROTOBUF_PV}.tar.bz2 )"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="emacs +ibus scim uim qt4"

RDEPEND="dev-libs/glib:2
	dev-libs/protobuf
	net-misc/curl
	sys-libs/zlib
	emacs? ( virtual/emacs )
	ibus? ( >=app-i18n/ibus-1.2 )
	scim? ( app-i18n/scim )
	qt4? (
		x11-libs/qt-gui:4
		app-i18n/zinnia
	)"
#	chewing? ( dev-libs/libchewing )
DEPEND="${RDEPEND}
	dev-util/gtest
	dev-util/pkgconfig"

S="${WORKDIR}/${MY_P}"

BUILDTYPE="${BUILDTYPE:-Release}"

RESTRICT="test"

SITEFILE=50${PN}-gentoo.el

pkg_setup() {
	python_set_active_version 2
}

src_prepare() {
	sed -i -e "s:/usr/lib/mozc:${EPREFIX}/usr/$(get_libdir)/mozc:" base/util.cc || die
	epatch "${FILESDIR}/${PN}-1.2.809.102-gentoo.patch"
	if use uim ; then
		cp -r "${WORKDIR}/protobuf-${PROTOBUF_PV}" protobuf/files || die
		cp -r "${FILESDIR}/uim" unix/ || die
		epatch "${FILESDIR}/mozc-kill-line.diff"
		epatch "${FILESDIR}/mozc-linux-protobuf.diff"
	fi
}

src_configure() {
	local myconf
	#use chewing && myconf="${myconf} --chewing"
	if ! use qt4 ; then
		myconf="${myconf} --noqt"
		export GYP_DEFINES="use_libzinnia=0"
	fi
	"$(PYTHON)" build_mozc.py gyp ${myconf} || die "gyp failed"
}

src_compile() {
	tc-export CC CXX AR AS RANLIB LD

	local mytarget="server/server.gyp:mozc_server"
	use emacs && mytarget="${mytarget} unix/emacs/emacs.gyp:mozc_emacs_helper"
	use ibus && mytarget="${mytarget} unix/ibus/ibus.gyp:ibus_mozc"
	use scim && mytarget="${mytarget} unix/scim/scim.gyp:scim_mozc unix/scim/scim.gyp:scim_mozc_setup"
	use uim && mytarget="${mytarget} unix/uim/uim.gyp:uim-mozc"
	if use qt4 ; then
		export QTDIR="${EPREFIX}/usr"
		mytarget="${mytarget} gui/gui.gyp:mozc_tool"
	fi

	"$(PYTHON)" build_mozc.py build_tools -c "${BUILDTYPE}" || die
	"$(PYTHON)" build_mozc.py build -c "${BUILDTYPE}" ${mytarget} || die

	if use emacs ; then
		elisp-compile unix/emacs/*.el || die
	fi
}

src_test() {
	"$(PYTHON)" build_mozc.py runtests -c "${BUILDTYPE}" || die
}

src_install() {
	if use emacs ; then
		dobin "out_linux/${BUILDTYPE}/mozc_emacs_helper" || die
		elisp-install ${PN} unix/emacs/*.{el,elc} || die
		elisp-site-file-install "${FILESDIR}/${SITEFILE}" ${PN} || die
	fi

	if use ibus ; then
		exeinto /usr/libexec || die
		newexe "out_linux/${BUILDTYPE}/ibus_mozc" ibus-engine-mozc || die
		insinto /usr/share/ibus/component || die
		doins "out_linux/${BUILDTYPE}/obj/gen/unix/ibus/mozc.xml" || die
		insinto /usr/share/ibus-mozc || die
		(
			cd data/images/unix
			newins ime_product_icon_opensource-32.png product_icon.png || die
			for f in ui-*
			do
				newins ${f} ${f/ui-} || die
			done
		)

	fi

	if use scim ; then
		exeinto "$(pkg-config --variable=moduledir scim)/IMEngine/" || die
		newexe "out_linux/${BUILDTYPE}/lib.target/libscim_mozc.so" mozc.so || die
		exeinto "$(pkg-config --variable=moduledir scim)/SetupUI/" || die
		newexe "out_linux/${BUILDTYPE}/lib.target/libscim_mozc_setup.so" mozc-setup.so || die
		insinto "$(pkg-config --variable=icondir scim)" || die
		(
			cd data/images/unix
			newins ime_product_icon_opensource-32.png scim-mozc.png || die
			for f in ui-*
			do
				newins ${f} ${f/ui-/scim-mozc-} || die
			done
		)
	fi

	if use uim ; then
		exeinto /usr/$(get_libdir)/uim/plugin
		doexe "out_linux/${BUILDTYPE}/libuim-mozc.so" || die
		insinto /usr/share/uim
		doins "${FILESDIR}/scm/mozc-custom.scm" || die
		doins "${FILESDIR}/scm/mozc-key-custom.scm" || die
		doins "${FILESDIR}/scm/mozc.scm" || die
	fi

	exeinto "/usr/$(get_libdir)/mozc" || die
	doexe "out_linux/${BUILDTYPE}/mozc_server" || die

	if use qt4 ; then
		exeinto "/usr/$(get_libdir)/mozc" || die
		doexe "out_linux/${BUILDTYPE}/mozc_tool" || die
	fi
}

pkg_postinst() {
	if use uim ; then
		ebegin "Register uim module"
		uim-module-manager --register mozc
	fi
}

pkg_postrm() {
	if use uim ; then
		ebegin "Unregister uim module"
		uim-module-manager --unregister mozc
	fi
}