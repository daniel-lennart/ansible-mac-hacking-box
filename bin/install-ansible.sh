#!/bin/sh

# Install development tools
xcode-select --install
sleep 1
osascript <<-EOD
    tell application "System Events"
      tell process "Install Command Line Developer Tools"
        keystroke return
        click button "Agree" of window "License Agreement"
      end tell
    end tell
EOD
sudo xcodebuild -license

# Allow Intel apps to run on Apple Silicone chips
/usr/sbin/softwareupdate --install-rosetta --agree-to-license
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py

# Install Ansible
sudo pip3 install --ignore-installed ansible

# Install required Galaxy roles
ansible-galaxy install -r galaxy-requirements.yml