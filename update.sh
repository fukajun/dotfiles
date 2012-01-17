#!/bin/sh
ORIGIN_DIR=`pwd`
cd `dirname $0`
SCRIPT_DIR=`pwd`
TARGET_DIR=$HOME
cd $ORIGIN_DIR
echo $HOME

if [ "$1" = "get" ]; then
  dis_dir=$SCRIPT_DIR
  src_dir=$TARGET_DIR
elif [ "$1" = "set" ]; then
  dis_dir=$TARGET_DIR
  src_dir=$SCRIPT_DIR
else
  exit
fi

for file in `ls -a $SCRIPT_DIR | grep "^\.\w"`
do
  echo   $src_dir/$file $dis_dir/
  cp -rp $src_dir/$file $dis_dir/
done
#cp -rp $src_dir/gitconfig $dis_dir/

