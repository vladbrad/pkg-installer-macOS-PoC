# install_daemon.py
import os

if __name__ == "__main__":
    # Install the PKG and capture the output from the installer
    stream = os.popen('installer -pkg {}/../Installer-PoC.pkg -target / 2>&1'.format(os.path.dirname(__file__)))
    print ('Installer output:\n', stream.read())
    stream.close()

    # Launch the GUI app
    os.system('open /Applications/HelloApp.app --args --UID $(uuidgen)')
    
    stream = os.popen('{}/../HelperTool --UID $(uuidgen)'.format(os.path.dirname(__file__)))
    print ('Helper tool output:\n', stream.read())
    stream.close()
