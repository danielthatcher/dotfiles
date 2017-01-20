#! /usr/bin/sh

#Uses nitrogen to set a random wallpaper on two monitors from two different source directories

source1='/home/daniel/Documents/Wallpapers/16-9/'
#source2='/home/daniel/Documents/Wallpapers/21-9/'
#source1='/home/daniel/Documents/Wallpapers/21-9/'

image1=$(ls $source1 | sort -R | tail -1)
#image2=$(ls $source2 | sort -R | tail -1)

#Currently requires nitrogen installed from git for --head option
nitrogen --set-scaled --head=0 "$source1$image1"
#nitrogen --set-scaled --head=1 "$source2$image2"

#Load terminal colours from images
if ! [ -f "/home/daniel/.wallpapers/$image2" ]; then
	zsh /home/daniel/.i3/wp/wp add "$source2$image2"
fi
zsh /home/daniel/.i3/wp/wp change "$image2"
