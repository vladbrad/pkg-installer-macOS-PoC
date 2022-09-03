#!/bin/sh

# Build Python daemon stand-alone executable.
pyinstaller --onedir --target-arch universal2 --noconfirm installer_poc_daemon.py

# Copy everything into their proper places.
BASEDIR=$(dirname "$0")
sudo cp $BASEDIR/com.bomgar.installer_poc_python_daemon.plist /Library/LaunchDaemons/
sudo cp -R $BASEDIR/dist/installer_poc_daemon /usr/local/bin/
sudo cp $BASEDIR/Build/Installer-PoC.pkg /usr/local/bin/

# Load the daemon.  Since the RunAtLoad and LaunchOnlyOnce properties are set to true it will launch right away and any time the system is restarted.
sudo launchctl load /Library/LaunchDaemons/com.bomgar.installer_poc_python_daemon.plist
