#!/bin/zsh

if [ "$1" = "gk" ] || [ "$1" = "gatekeeper" ]; then
  echo "Disabling Gatekeeper..."
  sudo spctl --master-disable
fi

echo "Done"
