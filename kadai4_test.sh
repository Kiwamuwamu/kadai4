#!/bin/bash

#システムソフトウェア特論　課題その４
#寺澤　極　20745126

ERROR_EXIT(){
    echo $1
    rm -f /tmp/$$-*
    exit 1
}
#入力チェック:引数は２つか
echo "input 2 argments" > /tmp/$$-args
./kadai4.sh 2 2>/tmp/$$-result && echo "エラーで終わらなかった"
diff /tmp/$$-args /tmp/$$-result || ERROR_EXIT "引数判定のところ"

#入力チェック：文字ではないか
echo "input natural numeber" > /tmp/$$-nat
./kadai4.sh a b 2>/tmp/$$-result && echo "エラーで終わらなかった"
diff /tmp/$$-nat /tmp/$$-result || ERROR_EXIT "テスト失敗"

#本体の動作確認チェック
echo 2 > /tmp/$$-ans
./kadai4.sh 2 4 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || ERROR_EXIT


rm -f /temp/$$-*
