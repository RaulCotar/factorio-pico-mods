#!/bin/zsh

concrete=/usr/share/factorio/base/graphics/terrain/concrete/refined-concrete.png

for src in "$@"; do

	dest="${src##*/}"
	echo -en "$src -> $dest: \e[31m"

	magick $1 -alpha extract -threshold '90%' tmp-mask.png &&

	magick $concrete -resize '25%' tmp-mask.png -compose copyopacity -composite tmp-conc-crop.png &&

	magick $concrete -resize '25%' -evaluate multiply 1.5 tmp-mask.png -compose copyopacity -composite tmp-conc-exp-crop.png &&

	magick \
		$src -colorspace hsv \
		tmp-conc-crop.png -colorspace hsv \
		-compose copyred -composite \
		-colorspace srgb \
		tmp-conc-exp-crop.png \
		-compose multiply -composite $dest &&

	rm tmp-*.png &&
	echo -e "\e[32mOK\e[0m"

done