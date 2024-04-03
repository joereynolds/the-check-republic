# Development 
Development is done with `docker` containers but is aliased for convenience in
the Makefile.
(The docker containers are only partly useful because you still need lua
installed locally for all the daemons etc...).
Run `docker-compose up` and then you can do any commands within the makefile.

`make test` - runs the unit tests
`make check` - lints the code

## Directory Structure

```
build/    - Build related scripts live here, usually called via the makefile
dist/     - The most recent executable lives in here
spec/     - Tests live in here
src/      - All source code lives in here
systemd/  - All files related to systemd (service and timers) live here
```
