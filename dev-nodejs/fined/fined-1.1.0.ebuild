# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Find a file given a declaration of locations"
HOMEPAGE="https://github.com/js-cli/fined"
SRC_URI="https://github.com/js-cli/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}
	>=dev-nodejs/expand-tilde-2.0.2
	>=dev-nodejs/is-plain-object-2.0.3
	>=dev-nodejs/object-defaults-1.1.0
	>=dev-nodejs/object-pick-1.2.0
	>=dev-nodejs/parse-filepath-1.0.1"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins index.js
	doins package.json
}
