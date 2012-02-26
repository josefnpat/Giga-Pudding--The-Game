#!/bin/bash
FILE=/usr/bin/love
 
if [ -f $FILE ];
then
  echo "$FILE exists"
  wget https://bitbucket.org/rude/love/downloads/love-0.7.2-win-x86.zip
  unzip love-0.7.2-win-x86.zip
  wget https://bitbucket.org/rude/love/downloads/love-0.7.2-macosx-ub.zip
  unzip love-0.7.2-macosx-ub.zip
else
  echo "Download Fail: $FILE does not exist"
fi
