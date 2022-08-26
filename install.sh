#!/bin/sh

# A somewhat kludgy way of passing a value to the postinstall script, using launchctl's setenv/getenv/unsetenv commands.
#sudo sh -c 'launchctl setenv HELLO_APP_ARG $(uuidgen); installer -pkg Build/HelloApp.pkg -target /; launchctl unsetenv HELLO_APP_ARG'

# Another, possibly better way of passing a value to the postinstall script via the package's file name.

PKG_SESSION_NAME=Build/Installer-PoC_$(uuidgen).pkg
cp Build/Installer-PoC.pkg $PKG_SESSION_NAME

sudo installer -pkg $PKG_SESSION_NAME -target /

rm $PKG_SESSION_NAME
