# update and install packages
echo "Updating packages"
yes | pkg up || { echo "Unable to update packages"; exit 1; }

echo "Installing python, ffmpeg, aria2"
yes | pkg install python ffmpeg aria2 || { echo "Unable to install packages"; exit 1; }

echo "Installing yt-dlp"
pip install yt-dlp ||  { echo "Unable to install yt-dlp"; exit 1; }

# creating folders
echo "Creating folders"
mkdir -p ~/.shortcuts/tasks
mkdir -p ~/bin

# setting directory variables
TASKS=~/.shortcuts/tasks
BIN=~/bin
USR_BIN=~/../usr/bin

# creating new scripts

## python web server
echo "Creating python web server script"
echo "cd /sdcard">$TASKS/server
echo "python -m http.server 8080">>$TASKS/server

## termux-url-opener
echo "Creating termux share menu"
echo "cwd=\$(pwd)">$BIN/termux-url-opener
echo "yt-dlp -f bv*+ba/b --windows-filenames --embed-chapters --embed-subs --write-auto-sub -P temp:\"\$cwd\" -P home:\"/sdcard/Download\" --downloader aria2c -o \"%(title)s-%(height)sp-%(id)s.%(ext)s\" \"\$1\" && echo \"\$1\">>downloaded.txt && exit">>$BIN/termux-url-opener
echo "echo \"\$1\">>failed.txt">>$BIN/termux-url-opener
echo "exit">>$BIN/termux-url-opener

## update-setup
echo "Creating updater"
echo "curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/adithya-s-sekhar/termux-setup/main/termux-setup.sh?\$RANDOM | sh">>$USR_BIN/update-setup

# setting permissions
echo "Settings permissions"
chmod +x $TASKS/server
chmod +x $BIN/termux-url-opener
chmod +x $USR_BIN/update-setup

# finished
echo "Installed Successfully"
echo
echo "The script was last updated on 2023-Aug-21 05:23PM IST."
