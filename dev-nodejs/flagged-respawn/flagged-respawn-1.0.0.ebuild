# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A tool for respawning node binaries when special flags are present"
HOMEPAGE="https://github.com/js-cli/js-flagged-respawn"
SRC_URI="https://github.com/js-cli/js-${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}"

S="${WORKDIR}/js-${P}"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins index.js
	insinto "/usr/$(get_libdir)/node_modules/${PN}/lib"
	doins lib/*
	doins package.json
}
