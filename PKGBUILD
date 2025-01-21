# Maintainer: Miguel Euraque <arch@vidaextrema.org>
pkgname=arch-party
pkgver=1.0
pkgrel=1
pkgdesc="Terminal color schemes and ASCII art customization for Arch Linux"
arch=('any')
url="https://github.com/mykeura/arch-party"
license=('MIT')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 arch_party.sh "$pkgdir/usr/bin/arch-party"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}