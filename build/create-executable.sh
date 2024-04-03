rm -rf dist/ && mkdir dist

cd src

#: : find src/ -iname *.lua | xargs -L1 basename
luastatic main.lua notifiers/notify-send.lua util.lua config.lua subcommands/help.lua subcommands/subcommands.lua subcommands/install.lua subcommands/run.lua subcommands/list.lua check.lua service.lua -llua5.4 -I/usr/include/lua5.4

rm main.luastatic.c
mv main ../dist/check-republicd

cd -
