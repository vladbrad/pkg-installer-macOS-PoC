#!/bin/sh

# Build products.
xcodebuild -workspace Installer_PoC.xcworkspace -scheme "HelloApp (macOS)" -configuration Release
xcodebuild -workspace Installer_PoC.xcworkspace -scheme "HelperTool" -configuration Release

mkdir -p Build/Products/Release/root/usr/local/bin && cp Build/Products/Release/HelperTool Build/Products/Release/root/usr/local/bin/

# Create installer packages.
pkgbuild --identifier com.bomgar.HelloApp --component Build/Products/Release/HelloApp.app --scripts HelloApp/Scripts --install-location /Applications Build/HelloApp.pkg
pkgbuild --identifier com.bomgar.HelperTool --root Build/Products/Release/root --scripts HelperTool/Scripts Build/HelperTool.pkg

# Create distribution package.
productbuild --synthesize --package Build/HelloApp.pkg --package Build/HelperTool.pkg Build/Distribution.xml
productbuild --distribution Build/Distribution.xml --package-path Build Build/Installer-PoC.pkg
