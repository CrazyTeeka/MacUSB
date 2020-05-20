#!/bin/bash

MACOS="Catalina"

if [ -z "$1" ]; then
  cp -R /Install\ macOS\ $MACOS.app /Volumes/Macintosh\ HD/
  cp -R /Volumes/macOS/SharedSupport /Volumes/Macintosh\ HD/Install\ macOS\ $MACOS.app/Contents/
  /Volumes/Macintosh\ HD/Install\ macOS\ $MACOS.app/Contents/Resources/startosinstall --volume /Volumes/Macintosh\ HD
elif [ "$1" = "upgrade" ]; then
  cp -R /Volumes/macOS\ Base\ System/Install\ macOS\ $MACOS.app $HOME/Desktop/
  cp -R /Volumes/macOS/SharedSupport $HOME/Desktop/Install\ macOS\ $MACOS.app/Contents/
fi
