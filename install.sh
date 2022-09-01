#!/bin/sh

# A somewhat kludgy way of passing a value to the postinstall script, using launchctl's setenv/getenv/unsetenv commands.
#sudo sh -c 'launchctl setenv HELLO_APP_ARG $(uuidgen); installer -pkg Build/HelloApp.pkg -target /; launchctl unsetenv HELLO_APP_ARG'

# Another, possibly better way of passing a value to the postinstall script via the package's file name.

#PKG=Build/Installer-PoC_$(uuidgen).pkg
#cp Build/Installer-PoC.pkg $PKG

PKG=Build/Installer-PoC.pkg

sudo installer -pkg $PKG -target /
open /Applications/HelloApp.app --args --UID $(uuidgen)
sudo sh -c "/usr/local/bin/HelperTool --UID $(uuidgen) > /var/tmp/HelperTool.log"

#rm $PKG_SESSION_NAME
