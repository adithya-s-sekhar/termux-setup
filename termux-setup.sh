# update and install packages
echo "Updating packages"
yes | pkg up || { echo "Unable to update packages"; exit 1; }

echo "Installing python, ffmpeg, aria2"
yes | pkg install python ffmpeg aria2 || { echo "Unable to install packages"; exit 1; }

echo "Installing yt-dlp and gallery-dl"
pip install yt-dlp gallery-dl ||  { echo "Unable to install python packages"; exit 1; }

# creating folders
echo "Creating folders"
mkdir -p ~/.shortcuts/tasks
mkdir -p ~/bin

# setting directory variables
TASKS=~/.shortcuts/tasks
BIN=~/bin
USR_BIN=~/../usr/bin

# setting file variables
SERVER=$TASKS/server
TERMUX_URL_OPENER=$BIN/termux-url-opener
UPDATE_SETUP=$USR_BIN/update-setup

# creating new scripts

## python web server
echo "Creating python web server script"
echo "cd /sdcard">$SERVER
echo "python -m http.server 8080">>$SERVER

## termux-url-opener
echo "Creating termux share menu"
echo "cwd=\$(pwd)">$TERMUX_URL_OPENER
echo "mkdir -p /sdcard/Download/Termux/yt-dlp">>$TERMUX_URL_OPENER
echo "mkdir -p /sdcard/Download/Termux/gallery-dl">>$TERMUX_URL_OPENER
echo "echo \"Choose app\"">>$TERMUX_URL_OPENER
echo "echo .">>$TERMUX_URL_OPENER
echo "echo \" - 1) yt-dlp\"">>$TERMUX_URL_OPENER
echo "echo \" - 2) gallery-dl\"">>$TERMUX_URL_OPENER
echo "echo .">>$TERMUX_URL_OPENER
echo "read choice">>$TERMUX_URL_OPENER
echo "if \$choice -eq 1">>$TERMUX_URL_OPENER
echo "then">>$TERMUX_URL_OPENER
echo "yt-dlp -f bv*+ba/b --windows-filenames --embed-chapters --no-mtime -P temp:\"\$cwd\" -P home:\"/sdcard/Download/Termux/yt-dlp\" -o \"%(title)s-%(id)s.%(ext)s\" \"\$1\" && echo \"\$1\">>/sdcard/Download/Termux/yt-dlp/downloaded.txt && exit">>$TERMUX_URL_OPENER
echo "echo \"\$1\">>/sdcard/Download/Termux/yt-dlp/failed.txt">>$TERMUX_URL_OPENER
echo "exit">>$TERMUX_URL_OPENER
echo "elif \$choice -eq 2">>$TERMUX_URL_OPENER
echo "then">>$TERMUX_URL_OPENER
echo "gallery-dl -d \"/sdcard/Download/Termux/gallery-dl\" \"\$1\" && echo \"\$1\">>/sdcard/Download/Termux/gallery-dl/downloaded.txt && exit">>$TERMUX_URL_OPENER
echo "echo \"\$1\">>/sdcard/Download/Termux/gallery-dl/failed.txt">>$TERMUX_URL_OPENER
echo "fi">>$TERMUX_URL_OPENER
echo "exit">>$TERMUX_URL_OPENER

## update-setup
echo "Creating updater"
echo "curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/adithya-s-sekhar/termux-setup/main/termux-setup.sh?\$RANDOM | sh">$UPDATE_SETUP

# setting permissions
echo "Settings permissions"
chmod +x $SERVER
chmod +x $TERMUX_URL_OPENER
chmod +x $UPDATE_SETUP

# finished
echo "Installed Successfully"
echo
echo "The script was last updated on 2024-Jun-05 17:11PM IST."
