# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#!/bin/sh

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/laurent22"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kr/text:7cafcd8"
	"github.com/jessevdk/go-flags:f2785f5"
	"github.com/laurent22/go-sqlkv:db1022a"
	"github.com/laurent22/go-trash:681610e"
	"github.com/mattn/go-sqlite3:e118d44"
	"github.com/nu7hatch/gouuid:179d4d0"
)

inherit golang-single

DESCRIPTION="Easily rename multiple files using your text editor"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
