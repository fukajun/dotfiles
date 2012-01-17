#!/bin/sh
cd `dirname $0`
SCRIPT_DIR=`pwd`
UPLOAD_DIR=`dirname $SCRIPT_DIR`
for file in `ls -a $SCRIPT_DIR`
do
  echo  $SCRIPT_DIR/$file $UPLOAD_DIR/$file
  cp -p $SCRIPT_DIR/$file $UPLOAD_DIR/$file
done

