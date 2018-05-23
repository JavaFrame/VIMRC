#!/bin/bash
dir=$1
if [ -z "$dir" ]
then
    echo "no output dir specified; using /tmp"
    dir=/tmp
fi

file=$dir/wallpaper.jpg

url="https://source.unsplash.com/random/1920x1080"

type=$2
if [ $type == "collection" ]
then
    collectionId=$3
    if [ -z $collectionId ]
    then
        echo "no collectionId was given"
    else
        url="https://source.unsplash.com/collection/$collectionId/1920x1080"
    fi
elif [ -z $type ]
then
    url="https://source.unsplash.com/random/1920x1080"
else
    echo "known type $2"
fi

wget -O "$file" "$url"
feh --bg-scale "$file"

echo "converting  $file to $dir/wallpaper.png"
