#!/bin/zsh

dock() {
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
}

finder() {
  defaults write com.apple.finder "FXPreferencesWindow.Location" -string '{{775, 775}, {525, 525}}'
  defaults write com.apple.finder "SidebarWidth" -float 260
  sleep 1
  killall Finder
}

dock
finder
