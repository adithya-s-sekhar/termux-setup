# update and install packages

yes | pkg up

yes | pkg install python ffmpeg aria2
pip install yt-dlp

# go to home folder to prepare setup

cd ~

# cleaning old files
rm -rf termux-setup

# creating setup folder
mkdir termux-setup
cd termux-setup

# creating new scripts

## python web server
echo "cd /sdcard">>server
echo "python -m http.server 8080">>server
dos2unix server

## termux-url-opener
echo "cd /sdcard/Download">>termux-url-opener
echo "yt-dlp -f bv*+ba/b --downloader aria2c -o \"%(title)100s-%(height)sp-%(id)10s.%(ext)s\" \"\$1\" && echo \"\$1\">>downloaded.txt && exit">>termux-url-opener
echo "echo \"\$1\">>failed.txt">>termux-url-opener
echo "exit">>termux-url-opener
dos2unix termux-url-opener

## batchdl
echo "cd /sdcard/Download">>batchdl
echo "mkdir \$1">>batchdl
echo "cp \$1.txt \$1">>batchdl
echo "cd \$1">>batchdl
echo "yt-dlp -f bv*+ba/b --downloader aria2c -o \"%(title)s-%(height)sp-%(id)s.%(ext)s\" -a \"\$1.txt\"">>batchdl
echo "cd ~">>batchdl
dos2unix batchdl

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

mkdir ~/.shortcuts/
mkdir ~/.shortcuts/tasks
mkdir ~/bin

# setting directory variables

TASKS=~/.shortcuts/tasks
BIN=~/bin
USR_BIN=~/../usr/bin

# deleting old files from these folders

rm $TASKS/server
rm $BIN/termux-url-opener
rm $USR_BIN/batchdl
rm $USR_BIN/update-setup

# copying files

cp server $TASKS
cp termux-url-opener $BIN
cp batchdl $USR_BIN
cp update-setup $USR_BIN

# setting permissions

chmod +x $TASKS/server
chmod +x $BIN/termux-url-opener
chmod +x $USR_BIN/batchdl
chmod +x $USR_BIN/update-setup

# cleaning up install folder

cd ~
rm -rf termux-setup

# finished

echo "Installed Successfully"
