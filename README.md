# check-republic

`check-republic` is an alert system for your local machine.
It can alert on things like high CPU usage, low battery, incoming emails or
anything else your brain can think of.

To get started, download the executable and run:

```
check-republic run &
```

(In the future this will be a daemon)

This will set `check-republic` running in the background. 

`check-republic` relies on "check" scripts having been written so it can report
on them. There are some examples you can copy from in this repo. They may not
all work for you, just make sure you put them in `$XDG_CONFIG_HOME`
(/home/you/.config/check-republic/checks/your-custom-check).

Once you have added some checks, you can test them with `check-republic run`.

To get the most out of `check-republic`, It's recommended you get started on
writing your own checks, read more [here](docs/CHECKS.md).

## CLI

Whilst `check-republic` is a service that runs scripts and alerts on them,
It's also a CLI to help you manage your checks

```
Usage: check-republic SUBCOMMAND
Options:
  -h, --help  Display this help
Available commands:
  edit     Edit a check
  help     Display this help
  install  Install the check-republic service and daemon (not implemented)
  list     List all checks
  run      Run all checks
```

### Command line options

#### `-h`, `--help`, `help`

Display the help and exit

#### `list`

Lists all the checks that live in `$XDG_CONFIG_HOME/check-republic/checks`
along with their optional description.

#### `run`

Runs all the checks that live in `$XDG_CONFIG_HOME/check-republic/checks`
along with their optional description.

Note that this isn't in a loop, this is a one-off run of all your checks.
Useful to debug your checks as you're writing them.

#### `edit`

Opens up the specified check and the respective config.lua in your `$EDITOR`.

For example:

```
check-republic edit low-battery
```

## Top level configuration

check-republic itself takes some configuration values too.  This config file
should live in `~/.config/check-republic/config.lua`.

Like the other configuration, it's also a `.lua` file.  Currently you can only
set what kind of `notifier` to use.  Only `notify-send` is supported until
people shout loud enough about others they want to use.

Example configuration:
```
return {
    notifier = 'notify-send'
}
```

This file is optional. If not specified, it will fall back to using
`notify-send`.

## Why?

Not all desktop environments or window managers have out of the box
notifications and alerts.  i3 strives for simplicity and minimalism at the
expense of notifying and alerting.  Often (for me anyway) the problem is
discovered too late (`i3status` is not always enough).

## Contributions & Development

If you'd like to contribute, you can read more on the workings of `check-republic`
[here](docs/DEVELOPMENT.md).

