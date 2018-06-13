# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Resolve a directory that is either local, global or in the user's home directory"
HOMEPAGE="https://github.com/jonschlinkert/resolve-dir"
SRC_URI="https://github.com/jonschlinkert/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}
	>=dev-nodejs/expand-tilde-2.0.0
	>=dev-nodejs/global-modules-1.0.0"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins index.js
	doins package.json
}
