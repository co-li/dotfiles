maim -su | convert - \( +clone -background black -shadow 80x3+5+5 \) +swap -background none -layers merge +repage ~/Screenshots/screenshot-shadow-$(date +%m-%d-%y-%H:%M:%S).png
