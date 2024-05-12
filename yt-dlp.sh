#!/bin/bash

# Set the directory where you want to put your downloaded files
directory=Media/Media/Inne

cd $directory
yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" $1
