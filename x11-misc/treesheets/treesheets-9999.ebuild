# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/dmenu/dmenu-9999.ebuild,v 1.2 2014/06/30 13:53:58 jer Exp $

EAPI=5
inherit eutils git-r3 toolchain-funcs

DESCRIPTION="Free Form Data Organizer"
HOMEPAGE="http://strlen.com/treesheets/"
EGIT_REPO_URI="https://github.com/aardappel/treesheets.git"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS=""
IUSE="gtk"

RDEPEND=">=x11-libs/wxGTK-3.0.1:3.0"
DEPEND="${RDEPEND}"

src_prepare() {
	# Respect our flags
	#sed -i \
	#	-e '/^CFLAGS/{s|=.*|+= -ansi -pedantic -Wall $(INCS) $(CPPFLAGS)|}' \
	#	-e '/^LDFLAGS/s|= -s|+=|' \
	#	config.mk || die
	# Make make verbose
	#sed -i \
	#	-e 's|^	@|	|g' \
	#	-e '/^	echo/d' \
	#	Makefile || die

	#restore_config config.def.h
	epatch_user
}

src_configure() {
	#tc-export PKG_CONFIG
}

src_compile() {
	#emake \
	#	CC=$(tc-getCC) \
	#	"XINERAMAFLAGS=$(
	#		usex xinerama "-DXINERAMA $(
	#			${PKG_CONFIG} --cflags xinerama 2>/dev/null
	#		)" ''
	#	)" \
	#	"XINERAMALIBS=$(
	#		usex xinerama "$(
	#			${PKG_CONFIG} --libs xinerama 2>/dev/null
	#		)" ''
	#	)"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/opt/${P}" install

	#save_config config.def.h
}
