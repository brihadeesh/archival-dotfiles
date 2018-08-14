#! /bin/bash
path="$HOME/Pictures/Screenshots"
name="scr-$(date +%T).png"
fp="$path/$name"

mkdir -p $path;

if [[ "$@" =~ "area" ]];then
	maim -s $fp
else
	scrot $fp
fi
echo $fp | xclip -selection clipboard

if [[ "$@" =~ "online" ]]; then
	file="$(readlink -f $fp)"
	basefile="$( basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g' )"
	curl -s --upload-file "$file" "https://transfer.sh/$basefile" | xclip -selection clipboard
fi
