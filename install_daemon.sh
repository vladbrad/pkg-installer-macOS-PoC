#!/bin/sh

# First copy everything into their proper places.
BASEDIR=$(dirname "$0")
sudo cp $BASEDIR/com.bomgar.installer_poc_daemon.plist /Library/LaunchDaemons/
sudo cp $BASEDIR/installer_poc_daemon.sh /usr/local/bin/
sudo cp $BASEDIR/Build/Installer-PoC.pkg /usr/local/bin/

# Load the daemon.  Since the RunAtLoad and LaunchOnlyOnce properties are set to true it will launch right away and any time the system is restarted.
sudo launchctl load /Library/LaunchDaemons/com.bomgar.installer_poc_daemon.plist
