# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Microsoft Application Insights module for Node"
HOMEPAGE="https://github.com/Microsoft/ApplicationInsights-node.js"
SRC_URI="https://github.com/Microsoft/ApplicationInsights-node.js/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-4.8.7"
RDEPEND="${DEPEND}
	>=dev-nodejs/node-diagnostic-channel-0.2.0
	>=dev-nodejs/node-diagnostic-channel-0.2.1
	>=dev-nodejs/zone-js-0.7.6"

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins .
	doins package.json
}
