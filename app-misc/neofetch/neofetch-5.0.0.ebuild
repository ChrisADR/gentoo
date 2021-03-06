# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/dylanaraps/${PN}/archive/${PV}/${P}.tar.gz"
	KEYWORDS="amd64 mips x86 ~amd64-fbsd"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dylanaraps/neofetch.git"
fi

DESCRIPTION="Simple information system script"
HOMEPAGE="https://github.com/dylanaraps/neofetch"
LICENSE="MIT-with-advertising"
SLOT="0"
IUSE="X"

RDEPEND="sys-apps/pciutils
	X? (
		media-gfx/imagemagick
		media-libs/imlib2
		www-client/w3m[imlib]
		x11-apps/xprop
		x11-apps/xrandr
		x11-apps/xwininfo
	)"

src_install() {
	emake DESTDIR="${ED}" install
}
