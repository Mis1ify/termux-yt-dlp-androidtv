# Termux YouTube video downloader for Android TV

Downloads YouTube videos to your external NAS over SSH.

It uses Termux and URL as a argument, as shown on a video:


[![Watch the video](https://img.youtube.com/vi/7Y96l3C445E/maxresdefault.jpg)](https://youtu.be/7Y96l3C445E)
## Examples of using

You like that youtube video, and you want to archive it to your local server NAS.


## Requirements

* [yt-dlp](https://github.com/yt-dlp/yt-dlp) as well as `ffmpeg` installed on your server
* `openssh-server` running on your server
* [Termux](https://github.com/termux/termux-app) app installed on your Android TV Client
* [SmartTube](https://github.com/yuliskov/SmartTube) app or something else that will get the "Share link..." popup

## Configuring

### Step 1: Configuring Termux on Android TV
To simplify steps I recommend connecting a keyboard to your Android TV.

1. Run `pkg update` and `pkg upgrade`
2. Run `pkg install openssh`

We need to be able to connect to our server without providing a password. To do that, we need to generate *SSH key pair*. In order to do that:

4. `ssh-keygen -t rsa 4096 -C "your_device_name"`
5. `Enter file in which to save the key (/home/yourusername/.ssh/id_rsa):` Press Enter
6. `Enter passphrase (empty for no passphrase):` Press Enter
7. Now, we need to upload your key to the server. We can do it with one command: `ssh-copy-id remote_username@server_ip_address` Replace `remote_username` and `server_ip_address` with your data
8. You will be prompted to enter remote_username password
9. SSH passwordless login should be now active on your Termux install

### Step 2: Configuring server
0. Confirm that `yt-dlp` is working on your server by typing `yt-dlp --version`
1. Download `yt-dlp.sh` from this repo
2. Edit `yt-dlp.sh`. Set up the directory where you want the files to be downloaded
3. Put `yt-dlp.sh` into your server's home directory

### Step 3: Putting download script into Termux
1. Download `termux-url-opener` from this repo
2. Edit `termux-url-opener`. Change `ip` and `hostname` variables to fit in your server's info
3. We need to put that script into Termux `/bin` directory. The simplest way would be copying the file from your PC into USB drive, then connecting it to your Android TV. However, some devices like `Mi TV Stick` don't have USB slot, so use ADB instead
4. In Termux `~` home directory, create a bin folder with `mkdir bin` command
5. Put `termux-url-opener` in that directory
6. All done! Termux should now be configured properly. Press 'Share link' in SmartTube or similiar app, select Termux, and your video should be now downloading to your server over SSH!
