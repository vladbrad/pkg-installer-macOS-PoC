#!/bin/sh

# Just run the installer and capture any errors and output to a file.
BASEDIR=$(dirname "$0")
installer -pkg $BASEDIR/Installer-PoC.pkg -target / > /var/tmp/installer_poc_daemon.log 2>&1

# Test launching the app and the helper.
open /Applications/HelloApp.app --args --UID $(uuidgen)
$BASEDIR/HelperTool --UID $(uuidgen) > /var/tmp/HelperTool.log
