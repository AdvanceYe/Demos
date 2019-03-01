##!/usr/bin/env bash
#
##H=`/Users/momo/Documents/Repository/MomoLua/MomoLua/src/Nearby`
#filename=NearbyCellConstant.lua
#cat $filename | while read line
#do
#    new_str=$(echo $line | sed -n 's/.*\.\(.*\)\=.*/\1/p')
#    echo -e $new_str >> result.text
##    sed -n '/./p' result.text
#
#
##    temp=`echo  "helloworld20180719" | tr -cd "[0-9]" `
##    echo $temp
#
##echo  "helloworld20180719" | tr -cd "[0-9]">mid.txt
##cat mid.txt
#
##echo -e $new_str >> $H/result.txt       #写入到新的文本中 并自动换行
#done
#

#!/bin/bash

#rootP = dirname $0
#echo rootp

function findLocalProperty()
{
    filename=$1
    cat $filename | while read line
    do
        new_str=$(echo $line | sed -n 's/.*\local \(.*\)\=.*/\1/p')
        echo -e $new_str >> luaLocalP.text
    done
}

function findProperty()
{
    filename=$1
    cat $filename | while read line
    do
        new_str=$(echo $line | sed -n 's/.*\.\(.*\)\=.*/\1/p')
        echo -e $new_str >> luaProperty.text
    done
}

function findMethod()
{
    filename=$1
    cat $filename | while read line
    do
        new_str=$(echo $line | sed -n 's/.*\:\(.*\)(.*/\1/p')
        echo -e $new_str >> luaMethod.text
    done
}

#遍历所有一级目录的.lua文件
for dir in `ls *.lua`
do
    echo $dir
#    findProperty $dir
#    findMethod $dir
    findLocalProperty $dir
done

#遍历所有二级目录的.lua文件
for dir in `ls`
do
    if [ -d $dir ]
    then
        cd $dir
        for sdir in `ls *.lua`
            do
            echo $sdir
#            findProperty $sdir
#            findMethod $sdir
            findLocalProperty $sdir
        done
        cd ..
    fi
done


################查找文件夹中的名字###################
##!/bin/bash
## get all filename in specified path、
#filename=NearbyCells
#path=$filename
#files=$(ls $path)
#for filename in $files
#do
#   echo $filename >> filename.txt
#done