apt update -y
apt upgrade -y
apt update -y
apt upgrade -y

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

cd ~

echo "Installed successfully"
