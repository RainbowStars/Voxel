#!/bin/bash

cd src/img/bkg/
for i in `jot 16 0 15`; do
    echo beep!
    convert +append `jot -n -s '.bmp ' 16 $((i * 16)); echo '.bmp'` ../../../build/$i.bmp
done
cd ../../../build/
convert -append `jot -n -s '.bmp ' 16 0; echo '.bmp'` -depth 4 bkg.png
rm `jot -n -s '.bmp ' 16 0; echo '.bmp'`

cd ../
cd src/img/spr/
for i in `jot 16 0 15`; do
    echo beep!
    convert +append `jot -n -s '.bmp ' 16 $((i * 16)); echo '.bmp'` ../../../build/$i.bmp
done
cd ../../../build/
convert -append `jot -n -s '.bmp ' 16 0; echo '.bmp'` -depth 4 spr.png
rm `jot -n -s '.bmp ' 16 0; echo '.bmp'`

cd ../
python2.7 tools/pilbmp2nes.py build/bkg.png build/bkg
python2.7 tools/pilbmp2nes.py build/spr.png build/spr

cd build/
cat bkg spr > CHR-ROM
rm bkg bkg.png spr spr.png