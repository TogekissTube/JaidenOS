#!/bin/sh
set -e
. ./build.sh
 
mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub
 
cp sysroot/boot/jaidenos.kernel isodir/boot/jaidenos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "The JaidenOS operating system" {
	multiboot /boot/jaidenos.kernel
}
EOF
grub-mkrescue -o jaidenos.iso isodir
