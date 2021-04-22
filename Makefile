check:
	luacheck ./src

executable:
	./build/create-executable.sh

test:
	busted

build: check test

.PHONY: test
