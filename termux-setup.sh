apt update -y
yes | apt upgrade -y
apt update -y
yes | apt upgrade -y

apt install python ffmpeg aria2 -y

pip install yt-dlp

cd ~

mkdir .shortcuts
cd .shortcuts
mkdir tasks
cd tasks
rm server

echo "cd /sdcard">>server
echo "python -m http.server 8080">>server

dos2unix server
chmod +x server

cd ~

mkdir bin
cd bin

rm termux-url-opener

echo "cd /sdcard/Download">>termux-url-opener
echo "yt-dlp -f bv*+ba/b --downloader aria2c -o \"%(title)s-%(height)sp-%(id)s.%(ext)s\" \"\$1\" && echo \"\$1\">>downloaded.txt && exit">>termux-url-opener
echo "echo \"\$1\">>failed.txt">>termux-url-opener
echo "exit">>termux-url-opener

dos2unix termux-url-opener
chmod +x termux-url-opener

rm batch
echo "cd /sdcard/Download">>batch
echo "mkdir \$1">>batch
echo "yt-dlp --ignore-errors --no-warnings --windows-filenames -f bv*+ba/b %aria2% -o \"\$1\%%(title).106s-high-%%(id).10s.%%(ext)s\" -a \"\$1.txt\"">>batch
echo "cd ~">>batch

dos2unix batch
chmod +x batch

rm update-setup
echo "cd ~">>update-setup
echo "rm termux-setup.sh">>update-setup
echo "curl https://raw.githubusercontent.com/adithya-s-sekhar/termux-setup/main/termux-setup.sh -o termux-setup.sh">>update-setup
echo "dos2unix termux-setup.sh">>update-setup
echo "chmod+x termux-setup.sh">>update-setup
echo "bash termux-setup.sh">>update-setup

dos2unix update-setup
chmod +x update-setup

cd ~

echo "Installed successfully"
