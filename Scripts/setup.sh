#!/bin/zsh

sudo scutil --set  ComputerName "Macintosh"
sudo scutil --set      HostName "Macintosh"
sudo scutil --set LocalHostName "Macintosh"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install localbrew/core/ds
brew install hashdeep
brew install rsync
brew unlink  rsync
brew link    rsync

brew cask install keepassxc
brew cask install meld

sudo trimforce enable
