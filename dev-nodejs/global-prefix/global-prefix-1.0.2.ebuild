# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Get the npm global path prefix"
HOMEPAGE="https://github.com/jonschlinkert/global-prefix"
SRC_URI="https://github.com/jonschlinkert/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}
	>=dev-nodejs/expand-tilde-2.0.2
	>=dev-nodejs/homedir-polyfill-1.0.1
	>=dev-nodejs/ini-1.3.4
	>=dev-nodejs/is-windows-1.0.1
	>=dev-nodejs/node-which-1.2.14"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins index.js
	doins package.json
}
