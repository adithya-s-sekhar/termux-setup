# My personal setup for termux.

## Includes

1. [termux-url-opener](#download-by-sharing-to-termux): Download videos in highest quality by sharing to termux.
2. [server](#http-server): A home screen widget for an http server serving 'Internal Storage' at http://\<device_ip>:8080/ or http://localhost:8080/.
3. [update-setup](#update-script): Update changes from the repository and reinstalls this script.

## How to Install

The following folders will be deleted when you run this script. If you already use them, edit the script accordingly.

- "~/.shortcuts"
- "~/bin"

1. Install [termux](https://github.com/termux/termux-app/releases/latest) and [termux-widget](https://github.com/termux/termux-widget/releases/latest) from github.
2. Open termux and grant storage permissions with `termux-setup-storage`.
3. Update all the inbuilt packages with `yes | pkg up`.
4. Install the script with `curl -L https://raw.githubusercontent.com/adithya-s-sekhar/termux-setup/main/termux-setup.sh | sh`

*Note: Depending on your Android skin you'd have to enable 'Display over other apps' permission for termux for the scripts to work.*

## How to use

### Download by sharing to termux.
1. Open any website or app with playing video in Chrome or any other app.
2. Touch the share button and share to Termux.
3. It will automatically download in the Highest possible quality and saves to your 'Download' folder.
4. It will also save all successfully downloaded urls to a 'Downloaded.txt' file and failed urls to 'Failed.txt'. This can help with debugging.

There are plans to bring [AYC](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc) to termux for more features and better quality selectors.

### HTTP Server
1. On your Android homescreen, Add a widget for termux actions and you'll see the 'server' script inside.
2. Opening it will start termux in the background and your files will be accessible at http://\<device_ip>:8080/ or http://localhost:8080/

### Update script
1. Enter `update-setup` and termux will download all changes from this repo and installs it.

## Links

[Termux](https://github.com/termux/termux-app/)

[Termux:Widget](https://github.com/termux/termux-widget/)

[the-termux-project](https://github.com/adithya-s-sekhar/the-termux-project/)

[Advanced Youtube Client - AYC](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/)
