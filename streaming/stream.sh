#! /bin/bash
 
# originaly from http://tinyurl.com/twitch-linux from taladan
# www.youtube.com/user/taladan
 
# gist created by brodul
 
INRES="1024x768" # input resolution (The resolution of the program you want to stream!)
OUTRES="800x720" # Output resolution (The resolution you want your stream to be at)
# Multiple of 160x144

FPS="30" # target FPS
QUAL="medium" 
# one of the many FFMPEG preset on (k)ubuntu found in /usr/share/ffmpeg
# If you have low bandwidth, put the qual preset on 'fast' (upload bandwidth)
# If you have medium bandwitch put it on normal to medium
 
# Write your key in a file named .twitch_key in your home directory
STREAM_KEY=$(cat ~/.twitch_key) # This is your streamkey generated by jtv/twitch found at: http://www.justin.tv/broadcast/adv_other
 
avconv \
-f x11grab -s $INRES -r "$FPS" -i :5.0 \
-f alsa -ac 2 -i null \
-vcodec libx264 -s $OUTRES \
-acodec libmp3lame -ab 128k -ar 44100 \
-threads 6 -qscale 3 -b 712000 -bufsize 512k \
-f flv "rtmp://live.justin.tv/app/$STREAM_KEY"
