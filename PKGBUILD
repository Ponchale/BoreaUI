pkgname="borealui"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Astian_OS GUI library"
arch=("x86_64")
url=("https://github.com/Ponchale/BoreaUI")
license=("GPL")
depends=('kwindowsystem' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols2')
makedepends=('git' 'extra-cmake-modules' 'ninja' 'qt5-tools')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

build() {
        cd BorealUI/
	cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  	ninja
}

package() {
        cd BorealUI
	DESTDIR="$pkgdir" ninja install
}
