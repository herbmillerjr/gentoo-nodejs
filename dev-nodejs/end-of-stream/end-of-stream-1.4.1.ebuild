# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Call a callback when a readable/writable/duplex stream has completed or failed"
HOMEPAGE="https://github.com/mafintosh/end-of-stream"
SRC_URI="https://github.com/mafintosh/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}
	>=dev-nodejs/once-1.4.0"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins index.js
	doins package.json
}
