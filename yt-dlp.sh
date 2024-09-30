#!/bin/bash
source .venv/bin/activate
# Set the directory where you want to put your downloaded files
directory=/mnt/media/Media/Inne


cd $directory

# Just download the video
#yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" $1

# Download the video with English and Polish Subtitles
#yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --write-sub --sub-lang en,pl --embed-metadata --parse-metadata "description:(?s)(?P<meta_comment>.+)" $1

# Download 1. video; 2. subtitles; 3. video thumbnail; 4. put video thumbnail into video (embed); 5. put videos from playlist to folder if a link is a playlist

if [[ $1 == *"playlist"* ]]; then
    yt-dlp --embed-thumbnail --write-thumbnail -o "%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s" -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --write-sub --sub-lang en,pl --embed-metadata --parse-metadata "description:(?s)(?P<meta_comment>.+)" "$1"
    
else

    yt-dlp --embed-thumbnail --write-thumbnail -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --write-sub --sub-lang en,pl --embed-metadata --parse-metadata "description:(?s)(?P<meta_comment>.+)" "$1"
fi
