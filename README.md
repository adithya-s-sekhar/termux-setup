# My personal setup for termux.

## Includes

1. yt-dlp for video downloads.
2. A home screen widget for an http server serving 'Internal Storage' at http://\<device_ip>:8080/ or http://localhost:8080/.

## How to Install

1. Install [termux](https://github.com/termux/termux-app/releases/latest) and [termux-widget](https://github.com/termux/termux-widget/releases/latest) from github.
2. Open termux, grant storage permission with `termux-setup-storage` command.
3. Download termux-setup.sh from this repo to your 'Internal Storage' or your Download folder or anywhere.
4. Navigate to the folder using termux, for example;
  - `cd /sdcard/`
  - `cd /sdcard/Download/`
  - `cd /sdcard/Documents/`

Fun fact: /sdcard is Android's nomenclature for Internal Storage. Not your removable sd card. Those will be /sdcard1. This is because in the early days of android an sd card was your Internal storage.

5. Execute the script by `sh termux-setup.sh`.
6. There will be a lot of prompts where you'd have to press Y or I when updating. It's because termux's shipping packages haven't been updated for a while. Press Y everywhere.
7. After installation, you can close termux.
8. Depending on your Android skin you'd have to enable 'Display over other apps' permission for termux for the scripts to work.

## How to use

### yt-dlp
1. Open any website or app with playing video in Chrome or any other app.
2. Touch the share button and share to Termux.
3. It will automatically download in the Highest possible quality and saves to your 'Download' folder.
4. It will also save all successfully downloaded urls to a 'Downloaded.txt' file and failed urls to 'Failed.txt'. This can help with debugging.

There are plans to bring [AYC](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc) to termux for more features and better quality selectors.

### HTTP Server
1. On your Android homescreen, Add a widget for termux actions and you'll see the 'server' script inside.
2. Opening it will start termux in the background and your files will be accessible at http://\<device_ip>:8080/ or http://localhost:8080/

## Links

[Termux](https://github.com/termux/termux-app/)

[Termux:Widget](https://github.com/termux/termux-widget/)

[the-termux-project](https://github.com/adithya-s-sekhar/the-termux-project/)

[Advanced Youtube Client - AYC](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/)
