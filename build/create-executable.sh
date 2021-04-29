rm -rf dist/ && mkdir dist

cd src

#: : find src/ -iname *.lua | xargs -L1 basename
luastatic notifiers/notify-send.lua util.lua config.lua subcommands/help.lua subcommands/subcommands.lua subcommands/install.lua subcommands/run.lua subcommands/list.lua check.lua service.lua main.lua /usr/lib/x86_64-linux-gnu/liblua5.3.a -I/usr/include/lua5.3

rm main.luastatic.c
mv main ../dist/check-republicd

cd -
