# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Callback wrapping utility"
HOMEPAGE="https://github.com/npm/wrappy"
SRC_URI="https://github.com/npm/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins wrappy.js
	doins package.json
}
