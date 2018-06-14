# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Like extend but only copies missing properties/values to the target object"
HOMEPAGE="https://github.com/jonschlinkert/object.defaults"
SRC_URI="https://github.com/jonschlinkert/${PN/-/.}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}
	>=dev-nodejs/array-each-1.0.1
	>=dev-nodejs/array-slice-1.0.0
	>=dev-nodejs/for-own-1.0.0
	>=dev-nodejs/isobject-3.0.0"

S="${WORKDIR}/${P/-/.}"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins index.js
	doins package.json
}
