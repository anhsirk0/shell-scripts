#!/bin/bash

sudo pacman -S pkg-config gcc cmake meson ninja gobject-introspection lollypop

cd /mnt/extras/Programs/lollypop/lollypop-1.1.4/
# meson builddir --prefix=/usr/local
sudo ninja -C builddir install
