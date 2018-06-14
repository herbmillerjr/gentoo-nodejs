# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="<DESCRIPTION>"
HOMEPAGE="https://github.com/<REPO>"
SRC_URI="https://github.com/<AUTHOR>/${PN}/archive/<VERSION_PREFIX>${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="<LICENSE>"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}<DEPENDENCIES>"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins <MAIN>
	doins package.json
}
