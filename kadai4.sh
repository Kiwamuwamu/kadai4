#!/bin/sh

#システムソフトウェア特論課題その４
#寺澤　極　20745126


#引数が２個ない場合のエラー
if [  $# -ne 2 ]
then
    echo "input 2 argments" 1>&2
    exit 1
fi

#引数に文字等を入力した場合のエラー
expr $1 + $2 > /dev/null 2>&1
if [ $? -ge 2 ]
then
    echo "input natural numeber" 1>&2
    exit 1
fi

#一度引数を、感覚的に扱いやすいので変数に格納
temp1=$1
temp2=$2

#処理を行う前に、引数１＞引数２となるように入れ替え
if [ $temp2 -gt $temp1 ]
then
    temp=$temp1
    temp1=$temp2
    temp2=$temp
fi

#ユークリッドの互除法を適用
while [ $temp2 -ne 0 ]
do
    r=$(( $temp1% $temp2))
    temp1=$temp2
    temp2=$r
done

#結果を出力
echo $temp1
