# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="path.isAbsolute() ponyfill"
HOMEPAGE="https://github.com/sindresorhus/path-is-absolute"
SRC_URI="https://github.com/sindresorhus/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins null
	doins package.json
}
