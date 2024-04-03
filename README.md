# check-republic (WIP - Doesn't work yet)

`check-republic` is a system monitoring notification service for X11 (If you
don't know what X11, you're probably already using it). It uses notify-send as
its backend to display warnings to the user about potential issues.

Checks live under `~/.config/check-republic/checks`.  Each check has a
directory containing the check itself and a configuration file for that check.

For example, a "low battery" check would have the following structure:

```
.config/
└── check-republic/
    └── checks
        └── low-battery
            ├── check
            ├── description
            └── config.lua
```

Note the `check` file. This is where our check is performed. It can be in any
language.  As long as you return the appropriate exit code (0 for success, 1
for failure), `check-republic` will know what to do.

**Naming is important**. Your check files _must_ be called "check" and your
configuration (if present) _must_ be called "config.lua".  Try and name the
directory of your checks as descriptive as possible. It will help you in the
long run.

The configuration file "config.lua" is optional but recommended. If not
specified, check-republic will fall back to sensible(ish) defaults

The `description` file is optional too. If present, it will display a
description of the check when you list out all the checks

## Prerequisites

- Lua 5.4
- luafilesystem

## Quick start

1. Make sure you have a notification server installed (I use `dunst`)
  1.1 Confirm it's working with `notify-send test`, you should see a notification displayed.
2. Create the check config directory and an example check
    ```
    mkdir -p ~/.config/check-republic/checks/always-fails
    touch ~/.config/check-republic/checks/always-fails/check
    sudo chmod a+x ~/.config/check-republic/checks/always-fails/check
    ```
3. (optional) configure your check
  3.1. `touch ~/.config/check-republic/checks/always-fails/config.lua`
  3.2. Place this code in it

  ```
  return {
    message = "Uh oh, your check failed",
  }
  ```

## Check configuration (config.lua)

Each check has a config file that can dictate various things about the check.
The configuration files are lua files (lua tables, more accurately) but you
don't need to be a lua maestro to configure a check.

```
return {
    -- The name of the check
    -- Default is inferred from the directory's name
    name = "the name of my check",

    -- Valid values are "xm" or "xh" where x is the number of minutes/hours you wish to run the script
    -- Default is 5m
    rate = "5m",

    -- The message to display on failure
    -- Default is inferred from the directory's name
    message = "The message of your failed check",

    -- Whether or not we should run this check
    -- Default is false
    disabled = true
}
```

**Real world example:**

```
return {
    name = "Low Battery",
    rate = "5m",
    message = "Your laptop has low battery. Consider charging it."
}
```

## Top level configuration

check-republic itself takes some configuration values too.  This config file
should live in `~/.config/check-republic/config.lua`.

Like the other configuration, it's also a `.lua` file.  Currently you can only
set what kind of `notifier` to use.  Note that only `notify-send` is currently
supported until people shout loud enough about others they want to use.

Example configuration:
```
return {
    notifier = 'notify-send'
}
```

This file is optional. If not specified, it will fall back to using
`notify-send`.

## Beginning the service

`check-republic` is a service itself and needs to constantly be running in
order to alert of issues when they arise.  Start the service with:

```
sudo systemctl enable check-republic
```

## Why?

Not all desktop environments or window managers have out of the box
notifications and alerts.  i3 strives for simplicity and minimalism at the
expense of notifying and alerting.  Often (for me anyway) the problem is
discovered too late (`i3status` is not always enough).

## CLI

Whilst `check-republic` is a service that runs scripts and alerts on them,
there is also the `check-republic` CLI which gives you insight into the checks.

```
check-republic 

-l, --list      List all checks
-r, --run=CHECK Manually run a check
-n, --new=CHECK Create a new check
```

## Requirements

Currently check-republic is quite small in the things it supports. As such you
need the following:

- X11 Window System - This is the default on Ubuntu and most other
  distributions so you should be fine here
- `dunst` (or another notification server) - This is used to display notifications from notification programs like `notify-send`
- `notify-send` - This is the default program to send notifications to on
  Ubuntu

If you're using a vanilla system with the above (which the majority do),
check-republic will "just work"

## Development

Development is done with `docker` containers but is aliased for convenience in the Makefile.
(The docker containers are only partly useful because you still need lua installed locally for all the daemons etc...)
Run `docker-compose up` and then you can do any commands within the makefile

`make test` - runs the unit tests
`make check` - lints the code

### Directory Structure

```
build/    - Build related scripts live here, usually called via the makefile
dist/     - The most recent executable lives in here
spec/     - Tests live in here
src/      - All source code lives in here
systemd/  - All files related to systemd (service and timers) live here
```
