#!/bin/sh
cd `dirname $0`
SCRIPT_DIR=`pwd`
TARGET_DIR=$HOME

[ "$1" == "get" ] && dis_dir=$SCRIPT_DIR && src_dir=$TARGET_DIR
[ "$1" == "set" ] && dis_dir=$TARGET_DIR && src_dir=$SCRIPT_DIR

for file in `ls -a $SCRIPT_DIR | grep "^\.\w"`
do
  echo   $src_dir/$file $dis_dir/
  cp -rp $src_dir/$file $dis_dir/
done
cp -rp $src_dir/gitconfig $dis_dir/

