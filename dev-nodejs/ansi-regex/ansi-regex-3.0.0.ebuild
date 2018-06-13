# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Regular expression for matching ANSI escape codes."
HOMEPAGE="https://github.com/chalk/ansi-regex"
SRC_URI="https://github.com/chalk/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}"

src_install() {
	local install_dir="/usr/$(get_libdir)/node_modules/${PN}"
	insinto $install_dir
	doins package.json
	insinto $install_dir/fixtures
	doins fixtures/ansi-codes.js
	exeinto $install_dir/fixtures
	doexe fixtures/view-codes.js
	exeinto $install_dir
	doexe index.js
	dosym ${EPREFIX}/$install_dir/index.js /usr/bin/${PN}
	dosym ${EPREFIX}/$install_dir/fixtures/view-codes.js /usr/bin/${PN}-view-supported
}
