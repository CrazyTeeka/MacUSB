#!/bin/zsh

SOURCE="/Volumes/USB/Mac"
TARGET="/Volumes/USB/Mac"

if [ "$1" = "backup" ]; then
  mkdir -p $TARGET/${(C)USER}/Applications
  mkdir -p $TARGET/${(C)USER}/Firefox
  mkdir -p $TARGET/${(C)USER}/Home
  rsync -a /Applications/* $TARGET/${(C)USER}/Applications/
  rsync -a $HOME/Documents $TARGET/${(C)USER}/Home/
  rsync -a $HOME/Downloads $TARGET/${(C)USER}/Home/
  rsync -a $HOME/Movies    $TARGET/${(C)USER}/Home/
  rsync -a $HOME/Music     $TARGET/${(C)USER}/Home/
  rsync -a $HOME/Pictures  $TARGET/${(C)USER}/Home/
  rm -rf $TARGET/${(C)USER}/Applications/Safari.app
  rm -rf $TARGET/${(C)USER}/Applications/Utilities
elif [ "$1" = "restore" ]; then
  rsync -a $SOURCE/${(C)USER}/Applications/* /Applications/
  rsync -a $SOURCE/${(C)USER}/Home/Documents $HOME/
  rsync -a $SOURCE/${(C)USER}/Home/Downloads $HOME/
  rsync -a $SOURCE/${(C)USER}/Home/Movies    $HOME/
  rsync -a $SOURCE/${(C)USER}/Home/Music     $HOME/
  rsync -a $SOURCE/${(C)USER}/Home/Pictures  $HOME/
elif [ "$1" = "copy-efi" ]; then
  sudo diskutil mount /dev/disk0s1 >/dev/null 2>/dev/null
  sudo rm -rf /Volumes/EFI/EFI
  sudo mkdir  /Volumes/EFI/EFI
  sudo cp -rf /Volumes/macOS/EFI-CLOVER/* /Volumes/EFI/EFI/
elif [ "$1" = "setup" ]; then
  sudo scutil --set ComputerName "Macintosh"
  sudo scutil --set HostName "Macintosh"
  sudo scutil --set LocalHostName "Macintosh"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew cask install keepassxc
  brew cask install meld
  brew install localbrew/core/ds
  brew install rsync
  brew unlink  rsync
  brew link    rsync
elif [ "$1" = "trim" ]; then
  sudo trimforce enable
elif [ "$1" = "config-dock" ]; then
  defaults write com.apple.dock "tilesize" -float 64
  defaults write com.apple.dock "magnification" -boolean false
  defaults write com.apple.dock "largesize" -float 128
  defaults write com.apple.dock "orientation" -string 'bottom'
  defaults write com.apple.dock "mineffect" -string 'scale'
  defaults write com.apple.dock "minimize-to-application" -boolean true
  defaults write com.apple.dock "launchanim" -boolean false
  defaults write com.apple.dock "autohide" -boolean false
  defaults write com.apple.dock "show-process-indicators" -boolean true
  defaults write com.apple.dock "show-recents" -boolean false
  sleep 1
  killall Dock
elif [ "$1" = "config-finder" ]; then
  defaults write com.apple.finder "FXPreferencesWindow.Location" -string '{{775, 775}, {525, 525}}'
  defaults write com.apple.finder "SidebarWidth" -float 260
  sleep 1
  killall Finder
elif [ "$1" = "disable-gatekeeper" ]; then
  sudo spctl --master-disable
elif [ "$1" = "remove-dsdt" ]; then
  sudo diskutil mount /dev/disk0s1 >/dev/null 2>/dev/null
  sudo rm -f /Volumes/EFI/EFI/CLOVER/ACPI/patched/DSDT.aml
  sudo rm -f /Volumes/EFI/EFI/OC/ACPI/DSDT.aml
elif [ "$1" = "mount" ]; then
  sudo diskutil mount /dev/disk0s1 >/dev/null 2>/dev/null
elif [ "$1" = "unmount" ]; then
  sudo diskutil unmount /dev/disk0s1 >/dev/null 2>/dev/null
fi
