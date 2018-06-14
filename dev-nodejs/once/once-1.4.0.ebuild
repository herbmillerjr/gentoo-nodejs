# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Run a function exactly one time"
HOMEPAGE="https://github.com/isaacs/once"
SRC_URI="https://github.com/isaacs/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}
	>=dev-nodejs/wrappy-1"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins once.js
	doins package.json
}
