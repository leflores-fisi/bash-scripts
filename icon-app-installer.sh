#!/bin/bash

ICON="" # icon name in .desktop file
ICON_DIR="/usr/share/icons/hicolor"

if [ -z "$ICON" ]; then
    echo "Error: empty icon name"
    exit 1
fi

for size in 16 22 24 32 36 48 64 72 96 128 256 512; do
    echo -n "Icon "$size"x"$size":"
	convert "$ICON.png" -resize "$size"x"$size" \
    "$ICON_DIR"/"$size"x"$size"/apps/"$ICON".png ; \
    echo " done"
done
gtk-update-icon-cache -f -t "$ICON_DIR"
