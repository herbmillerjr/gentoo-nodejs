# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Returns a filtered copy of an object with only the specified keys, similar to _"
HOMEPAGE="https://github.com/jonschlinkert/object.pick"
SRC_URI="https://github.com/jonschlinkert/${PN/-/.}/archive/${PV}.tar.gz -> ${P/-/.}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}
	>=dev-nodejs/isobject-3.0.1"

S="${WORKDIR}/${P/-/.}"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN/-/.}"
	doins index.js
	doins package.json
}
