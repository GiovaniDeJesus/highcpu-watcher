# High CPU Watcher

A Bash script that monitors processes on a Linux system and sends an email alert if a process consistently exceeds 100% CPU usage.

## Features

- Checks CPU usage every minute
- Confirms high usage with a second sample
- Sends an email alert if the same process is still over the threshold
- Optional systemd service for persistence

## Requirements

- `mail` command
- Local MTA (like Postfix) or external relay (e.g. `msmtp`)
- Linux with `ps`, `awk`, and `bash`

## Installation

1. Clone this repo:

   ```bash
   git clone https://github.com/yourusername/highcpu-watcher.git
   cd highcpu-watcher

2. Edit highcpu-watch.sh to set your email address.

3. Make it executable

   ```bash
   chmod +x highcpu-watch.sh

4. Optionally, install as a systemd service
   
   Replace "yourusername" with your actual Linux username

   ```bash
   sudo cp highcpu-watch.sh /usr/local/bin/highcpu-watch.sh
   sudo cp highcpu-watch.sh /usr/local/bin/highcpu-watch.sh
   sudo cp highcpu-watch.sh /usr/local/bin/highcpu-watch.sh
