#! /usr/bin/sh

#Uses nitrogen to set a random wallpaper on two monitors from two different source directories

source='/home/daniel/Documents/Wallpapers/16-9/'

image1=$(ls $source | sort -R | tail -1)
image2=$(ls $source | sort -R | tail -1)

nitrogen --set-scaled --head=0 "$source$image1"

# For the gtk lightdm greeter
cp $source$image2 /usr/share/pixmaps/greeter_wallpaper

#Load terminal colours from images
#if ! [ -f "/home/daniel/.wallpapers/$image2" ]; then
	#zsh /home/daniel/.i3/wp/wp add "$source2$image2"
#fi
#zsh /home/daniel/.i3/wp/wp change "$image2"
