#!/bin/bash

for i in $(cat ${1} | grep '.*\.\(png\|jpg\|jpeg\)'); do
        FILETYPE="${i##*.}"
        FILENAME="$ROOTPATH/$i"
        echo "Compressing $FILENAME...";

#        TODO: check if it could be compresed

#        if [ $FILETYPE == "png" ]; then
#                optipng -quiet -force -o7 "$FILENAME"
#                advpng --quiet -z4 "$FILENAME"
#                pngcrush -ow -q -rem gAMA -rem alla -rem cHRM -rem iCCP -rem sRGB -rem time "$FILENAME"
#        else
#                jpegoptim -o --quiet -f --strip-all "$FILENAME"
#        fi
#        git add $FILENAME
done