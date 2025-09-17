# Maintainer: Miguel Euraque (mykeura)
# URL: https://github.com/mykeura/arch-party
# Description: Terminal color schemes and ASCII art customization for Arch Linux
pkgname=arch-party
pkgver=1.0
pkgrel=1
pkgdesc="Terminal color schemes and ASCII art customization for Arch Linux"
arch=('any')
url="https://github.com/mykeura/arch-party"
license=('GPLv3')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 arch_party.sh "$pkgdir/usr/bin/arch-party"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
