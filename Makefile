check:
	luacheck ./src

executable:
	./build/create-executable.sh

install:
	./build/install.sh

test:
	busted

build: check test

.PHONY: test
