# pkg-installer-macOS-PoC
PoC for the macOS pkg installer.

This is a simple example of a sample app and a script to build the app and an installer package.  The installer package may consist of one or more payloads (applications, tools, etc.) and scripts preinstall and postinstall which the installer runs at respective stages of the installation.

## Passing a value to the app after it's automatically launched after install
Passing an unique value to the app when it's launched post-install is not very straight forward, there are a few options each with their own drawbacks:

1. Pass a value via the environment.  This doesn't really work because the installer is a daemon and the postinstall script doesn't have access to the caller's environment.  A possible workaround is to abuse the launchctl setenv/getenv mechanism to temporarily store the value and retrieve it from the postinstall script.  The values should be cleared with launchctl unsetenv afterwards, otherwise they stick around and are passed to other daemons launched thereafter.
1. Store the value as part of the package's file name.  The postinstall script can access the package's name from the PACKAGE_PATH environment variable and extract the value.
1. Distribute a config file containing the desired values along with the installer package.  The package and config file should probably be zipped or stored in a DMG image file to keep them together.
1. Include the config file with the application in the installer package.  This has the drawback that the package has to either be not signed or be signed/re-signed every time the config file changes.

## Creating a distribution package (meta package) from individual component packeages.

Installer PKG supports bundling multiple component packages into a single distribution package using the product build command.  All of the component packages in the distribution package will be installed and each of their preinstall/postinstall scripts will run.  Distribution packages also support allowing the user to select (or unselect) which components they wish to install when run via the GUI.
