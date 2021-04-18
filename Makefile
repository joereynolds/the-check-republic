check:
	luacheck ./src

executable:
	luastatic ./src/main.lua /usr/lib/x86_64-linux-gnu/liblua5.3.a -I/usr/include/lua5.3

test:
	@find test/ -type f | xargs lua

build: check test

.PHONY: test
