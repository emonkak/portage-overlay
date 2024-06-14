# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	aho-corasick@1.1.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	ansi-escapes@0.1.1
	anstream@0.6.4
	anstyle@1.0.4
	anstyle-parse@0.2.2
	anstyle-query@1.0.0
	anstyle-wincon@3.0.1
	arrayref@0.3.7
	arrayvec@0.7.4
	assert_matches@1.5.0
	atty@0.2.14
	autocfg@1.1.0
	bincode@1.3.3
	bitflags@1.3.2
	bitflags@2.4.1
	blake3@1.5.0
	block-buffer@0.10.4
	bstr@1.7.0
	bumpalo@3.14.0
	byte-unit@4.0.19
	byteorder@1.5.0
	bytesize@1.3.0
	cc@1.0.83
	cfg-if@1.0.0
	chrono@0.4.31
	clap@4.4.6
	clap_builder@4.4.6
	clap_derive@4.4.2
	clap_lex@0.5.1
	colorchoice@1.0.0
	console@0.15.7
	constant_time_eq@0.3.0
	core-foundation-sys@0.8.4
	cpufeatures@0.2.9
	crc32fast@1.3.2
	crossbeam-channel@0.5.8
	crossbeam-deque@0.8.3
	crossbeam-epoch@0.9.15
	crossbeam-utils@0.8.16
	crypto-common@0.1.6
	csv@1.3.0
	csv-core@0.1.11
	dashmap@5.5.3
	digest@0.10.7
	dirs@5.0.1
	dirs-sys@0.4.1
	dtparse@2.0.0
	dunce@1.0.4
	either@1.9.0
	encode_unicode@0.3.6
	equivalent@1.0.1
	errno@0.3.5
	fallible-iterator@0.3.0
	fastrand@2.0.1
	fiemap@0.1.1
	file-owner@0.1.2
	filetime@0.2.22
	fnv@1.0.7
	fs2@0.4.3
	fxhash@0.2.1
	generic-array@0.14.7
	getrandom@0.2.10
	globset@0.4.13
	hashbrown@0.12.3
	hashbrown@0.14.2
	heck@0.4.1
	hermit-abi@0.1.19
	hermit-abi@0.3.3
	hex@0.4.3
	iana-time-zone@0.1.58
	iana-time-zone-haiku@0.1.2
	ignore@0.4.20
	indexmap@1.9.3
	indexmap@2.0.2
	instant@0.1.12
	itertools@0.11.0
	itoa@1.0.9
	js-sys@0.3.64
	keccak@0.1.4
	lazy-init@0.5.1
	lazy_static@1.4.0
	libc@0.2.149
	linux-raw-sys@0.4.10
	lock_api@0.4.11
	log@0.4.20
	maplit@1.0.2
	memchr@2.6.4
	memoffset@0.9.0
	metrohash@1.0.6
	minimal-lexical@0.2.1
	nix@0.27.1
	nom@7.1.3
	nom-regex@0.2.0
	ntapi@0.4.1
	num-traits@0.2.17
	num_cpus@1.16.0
	once_cell@1.18.0
	option-ext@0.2.0
	parking_lot@0.11.2
	parking_lot_core@0.8.6
	parking_lot_core@0.9.9
	pin-project@1.1.3
	pin-project-internal@1.1.3
	ppv-lite86@0.2.17
	priority-queue@1.3.2
	proc-macro2@1.0.69
	quote@1.0.33
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rayon@1.8.0
	rayon-core@1.12.0
	redox_syscall@0.2.16
	redox_syscall@0.3.5
	redox_syscall@0.4.1
	redox_users@0.4.3
	reflink@0.1.3
	regex@1.10.2
	regex-automata@0.4.3
	regex-syntax@0.8.2
	rust_decimal@1.32.0
	rustix@0.38.20
	ryu@1.0.15
	same-file@1.0.6
	scopeguard@1.2.0
	serde@1.0.189
	serde_derive@1.0.189
	serde_json@1.0.107
	serde_test@1.0.176
	sha2@0.10.8
	sha3@0.10.8
	sled@0.34.7
	smallvec@1.11.1
	status-line@0.2.0
	stfu8@0.2.6
	strsim@0.10.0
	syn@2.0.38
	sysinfo@0.29.10
	tempfile@3.8.0
	terminal_size@0.3.0
	thiserror@1.0.50
	thiserror-impl@1.0.50
	thread_local@1.1.7
	typed-sled@0.2.3
	typenum@1.17.0
	unicode-ident@1.0.12
	unicode-width@0.1.11
	utf8-width@0.1.6
	utf8parse@0.2.1
	uuid@1.5.0
	version_check@0.9.4
	walkdir@2.4.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.87
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-shared@0.2.87
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-core@0.51.1
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	xattr@1.0.1
	xxhash-rust@0.8.7
"

inherit cargo

DESCRIPTION="Finds and removes duplicate files"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/pkolaczk/fclones"
SRC_URI="https://github.com/pkolaczk/fclones/archive/refs/tags/v${PV}.tar.gz
	$(cargo_crate_uris ${CRATES})"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 CC0-1.0 LGPL-3 MIT MIT-0 MPL-2.0 Unicode-DFS-2016 Unlicense"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

src_install() {
	cargo_src_install --path ./fclones/
}
