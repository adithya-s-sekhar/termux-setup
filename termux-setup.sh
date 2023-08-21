# update and install packages
echo "Updating packages"
yes | pkg up || { echo "Unable to update packages"; exit 1; }

echo "Installing python, ffmpeg, aria2"
yes | pkg install python ffmpeg aria2 || { echo "Unable to install packages"; exit 1; }

echo "Installing yt-dlp"
pip install yt-dlp ||  { echo "Unable to install yt-dlp"; exit 1; }

# go to home folder to prepare setup
rm -rf ~/termux-setup
mkdir ~/termux-setup
cd ~/termux-setup

# creating new scripts

## python web server
echo "Creating python web server script"
echo "cd /sdcard">server
echo "python -m http.server 8080">>server
dos2unix server

## termux-url-opener
echo "Creating termux share menu"
echo "cwd=\$(pwd)">termux-url-opener
echo "yt-dlp -f bv*+ba/b --windows-filenames --embed-chapters --embed-subs --write-auto-sub -P temp:\"\$cwd\" -P home:\"/sdcard/Download\" --downloader aria2c -o \"%(title)s-%(height)sp-%(id)s.%(ext)s\" \"\$1\" && echo \"\$1\">>downloaded.txt && exit">>termux-url-opener
echo "echo \"\$1\">>failed.txt">>termux-url-opener
echo "exit">>termux-url-opener
dos2unix termux-url-opener

## update-setup
echo "Creating updater"
echo "curl -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/adithya-s-sekhar/termux-setup/main/termux-setup.sh?\$RANDOM | sh">>update-setup
dos2unix update-setup

# deleting folders
echo "Deleting old files and folders"
rm -rf ~/.shortcuts
rm -rf ~/bin

# creating folders
echo "Creating folders"
mkdir ~/.shortcuts/
mkdir ~/.shortcuts/tasks
mkdir ~/bin

# setting directory variables
TASKS=~/.shortcuts/tasks
BIN=~/bin
USR_BIN=~/../usr/bin

# deleting old files from these folders
echo "Deleting old scripts from usr/bin"
rm $USR_BIN/update-setup

# copying files
echo "Copying new scripts"
cp server $TASKS
cp termux-url-opener $BIN
cp update-setup $USR_BIN

# setting permissions
echo "Settings permissions"
chmod +x $TASKS/server
chmod +x $BIN/termux-url-opener
chmod +x $USR_BIN/update-setup

# cleaning up install folder
echo "Cleaning up"
rm -rf ~\termux-setup

# finished
echo "Installed Successfully"
echo
echo "The script was last updated on 2023-Aug-21 05:04PM IST."

# personal repo (no commit msg)
