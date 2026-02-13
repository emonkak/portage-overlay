# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DOTNET_PKG_COMPAT="8.0"
NUGETS="
acornima@1.2.0
anglesharp@0.17.1
automapper@13.0.1
brotlisharplib@0.3.3
fasthashes@2.5.0
fluid.core@2.5.0
flurl@3.0.7
gitversion.msbuild@5.10.1
graphql-parser@7.2.0
graphql.dataloader@4.6.1
graphql.microsoftdi@4.8.0
graphql.newtonsoftjson@4.6.1
graphql.server.core@5.2.1
graphql.server.transports.aspnetcore.newtonsoftjson@5.2.1
graphql.server.transports.aspnetcore@5.2.1
graphql.server.transports.subscriptions.abstractions@5.2.1
graphql.server.transports.subscriptions.websockets@5.2.1
graphql.server.ui.altair@5.2.1
graphql.server.ui.graphiql@5.2.1
graphql.server.ui.playground@5.2.1
graphql.server.ui.voyager@5.2.1
graphql.systemreactive@4.6.1
graphql.systemreactive@4.8.0
graphql@4.6.1
graphql@4.8.0
hierarchicalpropertydefault@0.1.4-beta-g75fdf624b1
jint@4.4.2
jsonsubtypes@2.0.1
microsoft.aspnetcore.jsonpatch@6.0.8
microsoft.aspnetcore.mvc.newtonsoftjson@6.0.8
microsoft.bcl.asyncinterfaces@5.0.0
microsoft.bcl.asyncinterfaces@6.0.0
microsoft.bcl.asyncinterfaces@7.0.0
microsoft.bcl.hashcode@1.1.1
microsoft.codeanalysis.bannedapianalyzers@3.3.3
microsoft.csharp@4.7.0
microsoft.extensions.apidescription.server@6.0.5
microsoft.extensions.caching.abstractions@2.2.0
microsoft.extensions.caching.abstractions@3.0.0
microsoft.extensions.caching.memory@2.2.0
microsoft.extensions.caching.memory@3.0.0
microsoft.extensions.configuration.abstractions@2.0.0
microsoft.extensions.configuration.abstractions@3.1.0
microsoft.extensions.configuration.abstractions@3.1.8
microsoft.extensions.configuration.binder@2.0.0
microsoft.extensions.configuration.binder@3.1.0
microsoft.extensions.configuration@2.0.0
microsoft.extensions.configuration@3.1.0
microsoft.extensions.dependencyinjection.abstractions@3.0.0
microsoft.extensions.dependencyinjection.abstractions@6.0.0
microsoft.extensions.dependencyinjection@3.1.0
microsoft.extensions.dependencyinjection@6.0.0
microsoft.extensions.dependencymodel@3.0.0
microsoft.extensions.fileproviders.abstractions@1.1.1
microsoft.extensions.fileproviders.abstractions@3.1.8
microsoft.extensions.fileproviders.abstractions@6.0.0
microsoft.extensions.fileproviders.embedded@6.0.8
microsoft.extensions.hosting.abstractions@3.1.8
microsoft.extensions.logging.abstractions@3.0.0
microsoft.extensions.logging.abstractions@3.1.0
microsoft.extensions.logging.abstractions@3.1.8
microsoft.extensions.logging.abstractions@5.0.0
microsoft.extensions.logging@2.0.0
microsoft.extensions.logging@3.1.0
microsoft.extensions.logging@5.0.0
microsoft.extensions.options.configurationextensions@2.0.0
microsoft.extensions.options@2.0.0
microsoft.extensions.options@2.2.0
microsoft.extensions.options@3.0.0
microsoft.extensions.options@3.1.0
microsoft.extensions.options@5.0.0
microsoft.extensions.options@6.0.0
microsoft.extensions.primitives@1.1.1
microsoft.extensions.primitives@2.2.0
microsoft.extensions.primitives@3.0.0
microsoft.extensions.primitives@3.1.0
microsoft.extensions.primitives@3.1.8
microsoft.extensions.primitives@5.0.0
microsoft.extensions.primitives@6.0.0
microsoft.io.recyclablememorystream@2.3.2
microsoft.netcore.platforms@1.1.0
microsoft.netcore.platforms@5.0.0
microsoft.netcore.targets@1.1.0
microsoft.netframework.referenceassemblies.net472@1.0.3
microsoft.netframework.referenceassemblies@1.0.3
microsoft.openapi@1.2.3
microsoft.visualstudio.threading@17.6.40
microsoft.visualstudio.threading.analyzers@17.6.40
microsoft.visualstudio.validation@17.0.71
microsoft.visualstudio.validation@17.6.11
microsoft.win32.primitives@4.3.0
microsoft.win32.registry@4.3.0
microsoft.win32.registry@5.0.0
nerdbank.streams@2.10.72
netstandard.library@1.6.1
netstandard.library@2.0.3
newtonsoft.json@12.0.1
newtonsoft.json@12.0.3
newtonsoft.json@13.0.1
newtonsoft.json@13.0.3
newtonsoft.json.bson@1.0.2
nuglify@1.20.7
parlot@0.0.24
polly.caching.memory@3.0.2
polly@7.1.1
polly@7.2.3
polysharp@1.13.2
runtime.any.system.collections@4.3.0
runtime.any.system.diagnostics.tools@4.3.0
runtime.any.system.diagnostics.tracing@4.3.0
runtime.any.system.globalization.calendars@4.3.0
runtime.any.system.globalization@4.3.0
runtime.any.system.io@4.3.0
runtime.any.system.reflection.extensions@4.3.0
runtime.any.system.reflection.primitives@4.3.0
runtime.any.system.reflection@4.3.0
runtime.any.system.resources.resourcemanager@4.3.0
runtime.any.system.runtime.handles@4.3.0
runtime.any.system.runtime.interopservices@4.3.0
runtime.any.system.runtime@4.3.0
runtime.any.system.text.encoding.extensions@4.3.0
runtime.any.system.text.encoding@4.3.0
runtime.any.system.threading.tasks@4.3.0
runtime.any.system.threading.timer@4.3.0
runtime.debian.8-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.fedora.23-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.fedora.24-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.native.system.io.compression@4.3.0
runtime.native.system.net.http@4.3.0
runtime.native.system.security.cryptography.apple@4.3.0
runtime.native.system.security.cryptography.openssl@4.3.0
runtime.native.system@4.3.0
runtime.opensuse.13.2-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.opensuse.42.1-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.osx.10.10-x64.runtime.native.system.security.cryptography.apple@4.3.0
runtime.osx.10.10-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.rhel.7-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.ubuntu.14.04-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.ubuntu.16.04-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.ubuntu.16.10-x64.runtime.native.system.security.cryptography.openssl@4.3.0
runtime.unix.microsoft.win32.primitives@4.3.0
runtime.unix.system.console@4.3.0
runtime.unix.system.diagnostics.debug@4.3.0
runtime.unix.system.io.filesystem@4.3.0
runtime.unix.system.net.primitives@4.3.0
runtime.unix.system.net.sockets@4.3.0
runtime.unix.system.private.uri@4.3.0
runtime.unix.system.runtime.extensions@4.3.0
serilog.aspnetcore@6.0.1
serilog.enrichers.process@2.0.2
serilog.enrichers.thread@3.1.0
serilog.exceptions@8.4.0
serilog.expressions@3.4.1
serilog.extensions.hosting@5.0.1
serilog.extensions.logging@3.1.0
serilog.formatting.compact@1.1.0
serilog.settings.configuration@3.3.0
serilog.sinks.async@1.5.0
serilog.sinks.console@4.1.0
serilog.sinks.debug@2.0.0
serilog.sinks.file@5.0.0
serilog@2.12.0
spectre.console@0.47.0
structlinq@0.28.1
swashbuckle.aspnetcore.swagger@6.5.0
swashbuckle.aspnetcore.swaggergen@6.5.0
swashbuckle.aspnetcore.swaggerui@6.5.0
swashbuckle.aspnetcore@6.5.0
system.appcontext@4.3.0
system.buffers@4.3.0
system.buffers@4.5.1
system.collections.concurrent@4.3.0
system.collections.immutable@5.0.0
system.collections@4.3.0
system.commandline.namingconventionbinder@2.0.0-beta4.22272.1
system.commandline@2.0.0-beta4.22272.1
system.componentmodel.annotations@4.5.0
system.componentmodel.annotations@4.7.0
system.console@4.3.0
system.diagnostics.debug@4.3.0
system.diagnostics.diagnosticsource@4.3.0
system.diagnostics.process@4.3.0
system.diagnostics.tools@4.3.0
system.diagnostics.tracing@4.3.0
system.globalization.calendars@4.3.0
system.globalization.extensions@4.3.0
system.globalization@4.3.0
system.io.compression.zipfile@4.3.0
system.io.compression@4.3.0
system.io.filesystem.primitives@4.3.0
system.io.filesystem@4.3.0
system.io.pipelines@7.0.0
system.io@4.3.0
system.linq.expressions@4.3.0
system.linq@4.3.0
system.memory@4.5.1
system.memory@4.5.4
system.memory@4.5.5
system.net.http@4.3.0
system.net.nameresolution@4.3.0
system.net.primitives@4.3.0
system.net.sockets@4.3.0
system.numerics.vectors@4.4.0
system.numerics.vectors@4.5.0
system.objectmodel@4.3.0
system.private.uri@4.3.0
system.reactive.core@4.4.1
system.reactive.linq@4.4.1
system.reactive@4.4.1
system.reflection.emit.ilgeneration@4.3.0
system.reflection.emit.lightweight@4.3.0
system.reflection.emit@4.3.0
system.reflection.extensions@4.3.0
system.reflection.primitives@4.3.0
system.reflection.typeextensions@4.3.0
system.reflection.typeextensions@4.7.0
system.reflection@4.3.0
system.resources.resourcemanager@4.3.0
system.runtime.compilerservices.unsafe@4.3.0
system.runtime.compilerservices.unsafe@4.5.1
system.runtime.compilerservices.unsafe@4.5.2
system.runtime.compilerservices.unsafe@4.5.3
system.runtime.compilerservices.unsafe@5.0.0
system.runtime.compilerservices.unsafe@6.0.0
system.runtime.extensions@4.3.0
system.runtime.handles@4.3.0
system.runtime.interopservices.runtimeinformation@4.3.0
system.runtime.interopservices@4.3.0
system.runtime.numerics@4.3.0
system.runtime@4.3.0
system.security.accesscontrol@5.0.0
system.security.cryptography.algorithms@4.3.0
system.security.cryptography.cng@4.3.0
system.security.cryptography.csp@4.3.0
system.security.cryptography.encoding@4.3.0
system.security.cryptography.openssl@4.3.0
system.security.cryptography.primitives@4.3.0
system.security.cryptography.x509certificates@4.3.0
system.security.principal.windows@4.3.0
system.security.principal.windows@5.0.0
system.text.encoding.codepages@6.0.0
system.text.encoding.extensions@4.3.0
system.text.encoding@4.3.0
system.text.encodings.web@5.0.1
system.text.json@4.6.0
system.text.json@5.0.2
system.text.regularexpressions@4.3.0
system.threading.tasks.dataflow@5.0.0
system.threading.tasks.extensions@4.3.0
system.threading.tasks.extensions@4.5.4
system.threading.tasks@4.3.0
system.threading.thread@4.3.0
system.threading.threadpool@4.3.0
system.threading.timer@4.3.0
system.threading@4.3.0
system.valuetuple@4.5.0
system.xml.readerwriter@4.3.0
system.xml.xdocument@4.3.0
timezoneconverter@6.0.1
"

inherit dotnet-pkg

MY_PN="BililiveRecorder"

DESCRIPTION="BiliBili Stream Recorder"
HOMEPAGE="https://github.com/BililiveRecorder/BililiveRecorder"
SRC_URI="https://github.com/BililiveRecorder/BililiveRecorder/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
${NUGET_URIS}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

S="${WORKDIR}/${MY_PN}-${PV}"

DOTNET_PKG_PROJECTS=( BililiveRecorder.Cli )
DOTNET_PKG_BUILD_EXTRA_ARGS=( -p linux-x64 )
DOTNET_PKG_TEST_EXTRA_ARGS=( "${DOTNET_PKG_BUILD_EXTRA_ARGS[@]}" )
DOTNET_PKG_BAD_PROJECTS=(
  BililiveRecorder.WPF
  test/BililiveRecorder.Core.UnitTests
  test/BililiveRecorder.Flv.Tests
)

PATCHES=(
    "${FILESDIR}/${PN}-2.18.0-remove-git-version.patch"
)

DOCS=( README.md README_CN.md )

src_prepare() {
	local projects=(
		BililiveRecorder.Cli
		BililiveRecorder.Core
		BililiveRecorder.Flv
		BililiveRecorder.ToolBox
		BililiveRecorder.Web
	)

	for project in "${projects[@]}"; do
		cp "${FILESDIR}/GitVersionInformation.cs" "$project/" || die
		sed -e "s/@MAJOR@/$(ver_cut 1)/g" \
			-e "s/@MINOR@/$(ver_cut 2)/g" \
			-e "s/@PATCH@/$(ver_cut 3)/g" \
			-e "s/@PV@/${PV}/g" \
			-i "${project}/GitVersionInformation.cs" || die
	done

	dotnet-pkg_src_prepare

	sed -e "s/@PV@/${PV}/g" \
		-i Directory.Build.props || die
}

src_install() {
	dotnet-pkg-base_install
	dotnet-pkg-base_dolauncher "/usr/share/${P}/BililiveRecorder.Cli" bililive-recorder
	einstalldocs
}
