#!/bin/sh

# Build products
xcodebuild -workspace Installer_PoC.xcworkspace -scheme "HelloApp (macOS)" -configuration Release

# Create installer packages.
pkgbuild --identifier com.bomgar.HelloApp --component Build/Products/Release/HelloApp.app --scripts HelloApp/Scripts --install-location /Applications Build/HelloApp.pkg
