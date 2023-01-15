#!/bin/bash
./hugo --cleanDestinationDir
cd public
DEST="../../static/Romeinse-Catechismus.epub"
rm -f $DEST
zip -rX $DEST mimetype OEBPS META-INF

