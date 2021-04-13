#!/bin/bash

CF1="Series-9"

rm    -rf "$HOME/Desktop/Clover"
mkdir -p  "$HOME/Desktop/Clover"

cp -r "Clover/$CF1/EFI"    "$HOME/Desktop/Clover/"
cp -f "Clover/HfsPlus.efi" "$HOME/Desktop/Clover/EFI/CLOVER/drivers/UEFI/HfsPlus.efi"

rm -rf "$HOME/Desktop/Clover/EFI/CLOVER/drivers/BIOS"
rm -rf "$HOME/Desktop/Clover/EFI/CLOVER/misc"
rm -rf "$HOME/Desktop/Clover/EFI/CLOVER/themes/Olarila"

sed -i 's/<string>_STA RTC<\/string>/<string>RTC<\/string>/g'  "$HOME/Desktop/Clover/EFI/CLOVER/config.plist"
sed -i 's/<string>Olarila<\/string>/<string>Clovy<\/string>/g' "$HOME/Desktop/Clover/EFI/CLOVER/config.plist"
sed -i '198s/<integer>5<\/integer>/<integer>10<\/integer>/g'   "$HOME/Desktop/Clover/EFI/CLOVER/config.plist"
sed -i '583s/<key>#Inject<\/key>/<key>Inject<\/key>/g'         "$HOME/Desktop/Clover/EFI/CLOVER/config.plist"
sed -i '586s/<true\/>/<false\/>/g'                             "$HOME/Desktop/Clover/EFI/CLOVER/config.plist"

sed -i 's/<string>USB Port limit patch #1(credits PMheart)<\/string>/<string>USB Port Limit Patch #1 (10.15)<\/string>/g' "$HOME/Desktop/Clover/EFI/CLOVER/config.plist"
sed -i 's/<string>USB Port limit patch #2(credits PMheart)<\/string>/<string>USB Port Limit Patch #2 (10.15)<\/string>/g' "$HOME/Desktop/Clover/EFI/CLOVER/config.plist"

sed -i 's/<string>USB port limit patch #1 10.14.x modify by DalianSky(credit ydeng)<\/string>/<string>USB Port Limit Patch #1 (10.14)<\/string>/g'    "$HOME/Desktop/Clover/EFI/CLOVER/config.plist"
sed -i 's/<string>USB port limit patch #2 10.14.x modify by DalianSky(credit PMHeart)<\/string>/<string>USB Port Limit Patch #2 (10.14)<\/string>/g'  "$HOME/Desktop/Clover/EFI/CLOVER/config.plist"
sed -i 's/<string>USB Port limit patch #3 10.14.x modify by DalianSky(credits PMheart)<\/string>/<string>USB Port Limit Patch #3 (10.14)<\/string>/g' "$HOME/Desktop/Clover/EFI/CLOVER/config.plist"
sed -i 's/<string>USB Port limit patch #4 10.14.x modify by DalianSky(credits PMheart)<\/string>/<string>USB Port Limit Patch #4 (10.14)<\/string>/g' "$HOME/Desktop/Clover/EFI/CLOVER/config.plist"

sed -i '1085,1092d;961,1077d;646,766d;592,642d;577,582d;414,549d;385,386d;236,382d;213,232d;204,205d;154,159d;122,151d;25,28d;7,20d' "$HOME/Desktop/Clover/EFI/CLOVER/config.plist"
