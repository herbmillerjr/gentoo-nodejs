# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A dictionary of file extensions and associated module loaders"
HOMEPAGE="https://github.com/js-cli/js-interpret"
SRC_URI="https://github.com/js-cli/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins index.js
	doins package.json
}
