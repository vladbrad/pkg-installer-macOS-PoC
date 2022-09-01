#!/bin/sh

set +e

pkill -x HelloApp

# Clean everyting up.
sudo rm -r /Applications/HelloApp.app
sudo rm /usr/local/bin/HelperTool
sudo rm /usr/local/bin/installer_poc_daemon.sh
sudo rm /usr/local/bin/Installer-PoC.pkg
sudo rm /Library/LaunchDaemons/com.bomgar.installer_poc_daemon.plist
sudo rm /var/tmp/installer_poc_daemon.log
sudo rm /var/tmp/HelperTool.log
