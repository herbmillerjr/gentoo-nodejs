# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="resolve like require"
HOMEPAGE="https://github.com/browserify/resolve"
SRC_URI="https://github.com/browserify/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}
	>=dev-nodejs/path-parse-1.0.5"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins index.js
	insinto "/usr/$(get_libdir)/node_modules/${PN}/lib"
	doins lib/*
	doins package.json
}
