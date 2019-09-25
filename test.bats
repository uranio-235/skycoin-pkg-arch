#!/usr/bin/bats

# quita el proxy
setup() {
	export http_proxy=
	export https_proxy=
}

@test "correo electrónico del maintainer" {
	grep '# Maintainer: Lázaro Armando <aur at chipojosoft.com>' PKGBUILD
}


@test "la versión es «0.25»" {
	test $(cat PKGBUILD |grep pkgver|head -1|cut -d = -f 2) = "0.25"
}


@test "el release es «1»" {
	test $(cat PKGBUILD |grep pkgrel|head -1|cut -d = -f 2) = "1"
}


@test "el paquete tiene una descripción más o menos decente" {
	desc=$(cat PKGBUILD |grep pkgdesc|cut -d = -f 2)
	test ${#desc} -gt 50
}


@test "el paquete se llama «skycoin»" {
	test $(cat PKGBUILD |grep pkgname|cut -d = -f 2) = "skycoin"
}


@test "el enlace para descargar la fuente es válido" {
	skip "sin conexión"
	url=$(cat PKGBUILD |grep url|cut -d '"' -f 2)
	wget -c $url
}


@test "el paquete tiene una URL pública válida" {
	skip "sin conexión"
	url=$(cat PKGBUILD |grep url|cut -d '"' -f 2)
	curl -s -X HEAD -I $url
}


@test "suma control md5sum sin usar SKIP" {
	suma=$(cat PKGBUILD|grep md5sum|cut -d "'" -f 2)
	test ${#suma} -eq 32
}


@test "función build() presente" {
	grep "build()" PKGBUILD
}


@test "función package() presente" {
	grep "package()" PKGBUILD
}


@test "crear el paquete satisfactoriamente" {
	makepkg
}
