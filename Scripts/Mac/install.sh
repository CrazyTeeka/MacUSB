#!/bin/bash

MACOS="Catalina"

if [ $MACOS = "Catalina" ]; then
  cp -R /Install\ macOS\ Catalina.app /Volumes/Macintosh\ HD/
  cp -R /Volumes/macOS/SharedSupport /Volumes/Macintosh\ HD/Install\ macOS\ Catalina.app/Contents/
  /Volumes/Macintosh\ HD/Install\ macOS\ Catalina.app/Contents/Resources/startosinstall --volume /Volumes/Macintosh\ HD
fi
