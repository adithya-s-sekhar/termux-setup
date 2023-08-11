# update and install packages

echo "Updating packages"

yes | pkg up || { echo "Unable to update packages"; exit 1; }

echo "Installing python, ffmpeg, aria2"

yes | pkg install python ffmpeg aria2 || { echo "Unable to install packages"; exit 1; }

echo "Installing yt-dlp"

pip install yt-dlp ||  { echo "Unable to install yt-dlp"; exit 1; }

# go to home folder to prepare setup

cd ~

# cleaning old files

echo "Cleaning old setup folder"

rm -rf termux-setup

# creating setup folder

echo "Creating setup folder"

mkdir termux-setup
cd termux-setup

# creating new scripts

echo "Creating python web server script"

## python web server
echo "cd /sdcard">>server
echo "python -m http.server 8080">>server
dos2unix server

echo "Creating termux share menu"

## termux-url-opener
echo "cwd=\$(pwd)">>termux-url-opener
echo "cd /sdcard/Download">>termux-url-opener
echo "yt-dlp -f bv*+ba/b --windows-filenames --embed-chapters --embed-thumbnail --embed-subs --write-auto-sub -P home:\"\$cwd\" --downloader aria2c -o \"%(title)s-%(height)sp-%(id)s.%(ext)s\" \"\$1\" && echo \"\$1\">>downloaded.txt && exit">>termux-url-opener
echo "echo \"\$1\">>failed.txt">>termux-url-opener
echo "exit">>termux-url-opener
dos2unix termux-url-opener

echo "Creating batch downloader"

## batchdl
echo "cwd=\$(pwd)">>batchdl
echo "cd /sdcard/Download">>batchdl
echo "mkdir \$1">>batchdl
echo "cp \$1.txt \$1">>batchdl
echo "cd \$1">>batchdl
echo "yt-dlp -f bv*+ba/b --windows-filenames --embed-chapters --embed-thumbnail --embed-subs --write-auto-sub -P home:\"\$cwd\" --downloader aria2c -o \"%(title)s-%(height)sp-%(id)s.%(ext)s\" -a \"\$1.txt\"">>batchdl
echo "cd ~">>batchdl
dos2unix batchdl

echo "Creating updater"

## update-setup

echo "cd ~">>update-setup
echo "curl https://raw.githubusercontent.com/adithya-s-sekhar/termux-setup/main/termux-setup.sh | sh">update-setup
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

rm $USR_BIN/batchdl
rm $USR_BIN/update-setup

# copying files

echo "Copying new scripts"

cp server $TASKS
cp termux-url-opener $BIN
cp batchdl $USR_BIN
cp update-setup $USR_BIN

# setting permissions

echo "Settings permissions"

chmod +x $TASKS/server
chmod +x $BIN/termux-url-opener
chmod +x $USR_BIN/batchdl
chmod +x $USR_BIN/update-setup

# cleaning up install folder

echo "Cleaning up"

cd ~
rm -rf termux-setup

# finished

echo "Installed Successfully"
echo
echo "The script was last updated on 2023-Aug-11 11:25AM IST."
