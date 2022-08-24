#!/bin/sh

# A somewhat kludgy way of passing a value to the postinstall script, using launchctl's setenv/getenv/unsetenv commands.
sudo sh -c 'launchctl setenv HELLO_APP_ARG $(uuidgen); installer -pkg Build/HelloApp.pkg -target /; launchctl unsetenv HELLO_APP_ARG'
