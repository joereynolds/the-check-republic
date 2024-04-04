# check-republic (WIP - Doesn't work yet)

`check-republic` is an alert system for your local machine.
It can alert on things like high CPU usage, low battery, incoming emails or
anything else your brain can think of.

To get started, download the executable and run

```
check-republic run &
```

(In the future this will be a daemon)

This will set `check-republic` running in the background. 
There are some example checks which you can copy over.

## Custom checks

If you'd like to get started on writing your own checks, read more
[here](docs/CHECKS.md).

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

-l, --list       List all checks
-r, --run=CHECK  Manually run a check
-n, --new=CHECK  Create a new check
-e, --edit=CHECK Edit an existing check
```

## Contributions & Development

If you'd like to contribute, you can read more on the workings of `check-republic`
[here](docs/DEVELOPMENT.md).

