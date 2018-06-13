# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The streaming build system"
HOMEPAGE="https://gulpjs.com/"
SRC_URI="https://github.com/gulpjs/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-libs/nodejs[npm]"
RDEPEND="${DEPEND}"

src_install() {
	echo ${D}
	npm install -g --prefix "${D}" "${DISTDIR}"/"${P}.tar.gz" || die
}
