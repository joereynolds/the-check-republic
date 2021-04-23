rm -rf dist/ && mkdir dist

cd src

luastatic main.lua check.lua config.lua util.lua notifiers/notify-send.lua /usr/lib/x86_64-linux-gnu/liblua5.3.a -I/usr/include/lua5.3

rm main.luastatic.c
mv main ../dist/check-republicd

cd -
