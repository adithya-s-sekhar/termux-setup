# get storage permissions

echo "Press Allow to give storage permissions"

termux-setup-storage

# update and install packages

echo "Updating packages"

yes | pkg up

echo "Installing python, ffmpeg, aria2"

yes | pkg install python ffmpeg aria2

echo "Installing yt-dlp"

pip install yt-dlp

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
echo "cd /sdcard/Download">>termux-url-opener
echo "yt-dlp -f bv*+ba/b --downloader aria2c -o \"%(title)100s-%(height)sp-%(id)10s.%(ext)s\" \"\$1\" && echo \"\$1\">>downloaded.txt && exit">>termux-url-opener
echo "echo \"\$1\">>failed.txt">>termux-url-opener
echo "exit">>termux-url-opener
dos2unix termux-url-opener

echo "Creating batch downloader"

## batchdl
echo "cd /sdcard/Download">>batchdl
echo "mkdir \$1">>batchdl
echo "cp \$1.txt \$1">>batchdl
echo "cd \$1">>batchdl
echo "yt-dlp -f bv*+ba/b --downloader aria2c -o \"%(title)s-%(height)sp-%(id)s.%(ext)s\" -a \"\$1.txt\"">>batchdl
echo "cd ~">>batchdl
dos2unix batchdl

echo "Creating upater"

## update-setup

echo "cd ~">>update-setup
echo "rm -rf termux-setup">>update-setup
echo "mkdir termux-setup">>update-setup
echo "cd termux-setup">>update-setup
echo "curl https://raw.githubusercontent.com/adithya-s-sekhar/termux-setup/main/termux-setup.sh>termux-setup.sh">>update-setup
echo "dos2unix termux-setup.sh">>update-setup
echo "chmod +x termux-setup.sh">>update-setup
echo "bash termux-setup.sh">>update-setup
dos2unix update-setup

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

echo "Deleting old scripts"

rm $TASKS/server
rm $BIN/termux-url-opener
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
