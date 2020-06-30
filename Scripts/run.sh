#!/bin/zsh

SOURCE="/Volumes/USB/Mac"
TARGET="/Volumes/USB/Mac"

if [ -z "$1" ]; then
  echo "Usage: run.sh backup"
  echo "       run.sh backup-apps"
  echo "       run.sh backup-firefox"
  echo "       run.sh restore"
  echo "       run.sh copy-clover"
  echo "       run.sh setup"
  echo "       run.sh trim-enable"
  echo "       run.sh disable-gatekeeper"
  echo "       run.sh mount-efi"
  echo "       run.sh reset-dock"
  exit 0
fi

if [ "$1" = "backup" ]; then
  mkdir -p $TARGET/${(C)USER}/Home
  rsync -a $HOME/Documents $TARGET/${(C)USER}/Home/
  rsync -a $HOME/Downloads $TARGET/${(C)USER}/Home/
  rsync -a $HOME/Movies    $TARGET/${(C)USER}/Home/
  rsync -a $HOME/Music     $TARGET/${(C)USER}/Home/
  rsync -a $HOME/Pictures  $TARGET/${(C)USER}/Home/
elif [ "$1" = "backup-apps" ]; then
  mkdir -p $TARGET/${(C)USER}/Applications
  rsync -a /Applications/* $TARGET/${(C)USER}/Applications/
elif [ "$1" = "backup-firefox" ]; then
  mkdir -p $TARGET/${(C)USER}/Library/Application\ Support/Firefox
  mkdir -p $TARGET/${(C)USER}/Library/Caches/Firefox
  mkdir -p $TARGET/${(C)USER}/Library/Preferences
  mkdir -p $TARGET/${(C)USER}/Library/Saved\ Application\ State
  rsync -a $HOME/Library/Application\ Support/Firefox                             $TARGET/${(C)USER}/Library/Application\ Support/
  rsync -a $HOME/Library/Caches/Firefox                                           $TARGET/${(C)USER}/Library/Caches/
  rsync -a $HOME/Library/Preferences/org.mozilla.firefox.plist                    $TARGET/${(C)USER}/Library/Preferences/
  rsync -a $HOME/Library/Saved\ Application\ State/org.mozilla.firefox.savedState $TARGET/${(C)USER}/Library/Saved\ Application\ State/
elif [ "$1" = "restore" ]; then
  rsync -a $SOURCE/${(C)USER}/Home/Documents $HOME/
  rsync -a $SOURCE/${(C)USER}/Home/Downloads $HOME/
  rsync -a $SOURCE/${(C)USER}/Home/Movies    $HOME/
  rsync -a $SOURCE/${(C)USER}/Home/Music     $HOME/
  rsync -a $SOURCE/${(C)USER}/Home/Pictures  $HOME/
elif [ "$1" = "copy-clover" ]; then
  sudo diskutil mount /dev/disk0s1 >/dev/null 2>/dev/null
  sudo rm -rf /Volumes/EFI/EFI
  sudo mkdir  /Volumes/EFI/EFI
  sudo cp -rf /Volumes/macOS/EFI-CLOVER/* /Volumes/EFI/EFI/
elif [ "$1" = "setup" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew cask install keepassxc
  brew cask install meld
  brew install localbrew/core/ds
  brew install rsync
  brew unlink  rsync
  brew link    rsync
elif [ "$1" = "trim-enable" ]; then
  sudo trimforce enable
elif [ "$1" = "disable-gatekeeper" ]; then
  sudo spctl --master-disable
elif [ "$1" = "mount-efi" ]; then
  sudo diskutil mount /dev/disk0s1 >/dev/null 2>/dev/null
elif [ "$1" = "reset-dock" ]; then
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
fi
