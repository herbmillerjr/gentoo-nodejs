# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="7zip Windows Package via Node"
HOMEPAGE="https://github.com/fritx/win-7zip"
SRC_URI="https://github.com/fritx/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GNU LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/win-"${P}"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins index.js
	doins package.json
}
