# iMona lServer Access Count
#----------------------------------------
#!/bin/sh

if [ "$1" = "config" ]; then
  echo 'graph_title iMonaServerAccess' # グラフのタイトル。
  echo 'graph_args --base 1000 -l 0' # いわゆるベースとなるY軸の大きさ。一応、1000にしてあるけどアクセス数が多くて既に40Mとか表示されてるorz
  echo 'graph_vlabel Access' # グラフのラベル。y軸のとこに出ます。
  echo 'graph_category other' # グラフのカテゴリ。一覧のHTMLで表示されるカテゴリ。DiskとかNetworkとかOtherとかProcessesとかのやつ。
  echo 'graph_info iMona Access Count.' # グラフの情報。詳細ページの下の方に出る。
#以下、各グラフ線の設定
  echo 'ezplus.label ezplus' #名前
  echo 'ezplus.draw LINE2'   #グラフの種別。ひとまず普通に線形表示
  echo 'ezplus.info total ezplus count.' #詳細説明なんだけど、特にいらね。

  echo 'iappli.label iappli'
  echo 'iappli.draw LINE2'
  echo 'iappli.info total iappli count.'

  echo 'JAVAappli.label JAVAappli'
  echo 'JAVAappli.draw LINE2'
  echo 'JAVAappli.info total JAVAappli count.'
  exit 0
fi
#各グラフ線の値。名前.valueに続いて値を出力してるだけ。
echo -n "ezplus.value "
cut -f 1 /var/www/html/o/iMonaLog.txt

echo -n "iappli.value "
cut -f 2 /var/www/html/o/iMonaLog.txt

echo -n "JAVAappli.value "
cut -f 3 /var/www/html/o/iMonaLog.txt