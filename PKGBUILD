# Maintainer: Lázaro Armando <aur at chipojosoft.com>

# vim: noai:ts=4:sw=4

pkgname=skycoin
pkgrel=1
pkgver=0.25
pkgdesc="Skycoin is a very ambitious cryptocurrency project that has a lot of different moving parts."
url="https://www.skycoin.net"
arch=('x86_64')
license=('GNU')
source=('https://downloads.skycoin.net/wallet/skycoin-0.25.0-gui-standalone-linux-x64.tar.gz')
md5sums=('dcb78b02ca14d68ef9a184de53040e7f')
#depends=('go')


build()
{
	cd skycoin-0.25.0-gui-standalone-linux-x64
	test -f skycoin
	test -d src/
}


package()
{
	cd skycoin-0.25.0-gui-standalone-linux-x64
	DESTDIR="$pkgdir/" install
}

