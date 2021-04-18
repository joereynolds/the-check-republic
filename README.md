# Nothing here yet, carry on...

# check-republic

`check-republic` is a system monitoring notification service. Currently it uses notify-send as its backend to
display warnings to the user about potential issues.

Checks live under `~/.config/check-republic/checks`.
Each check has a directory containing the check itself and the message to show to the user if that check fails.

For example, a "low battery" check would have the following structure:

```
check-republic/
└── checks
    └── low-battery
        ├── check.sh
        └── config
```

Note the `check.sh` file. This is where our check is performed. It can be in any language.
As long as you return the appropriate exit code (0 for success, 1 for failure), `check-republic` will know what to do.
**Naming is important**. Your check files _must_ begin with "check" and your message will be contained within a config file called "config".
Try and make the check names as descriptive as possible. It will help you in the long run.

## Check configuration (configs)

Each check has a config file that can dictate various things about the check.
The configuration files are lua files but you don't need to be a lua maestro to configure a check.

```
name = "the name of my check" -- If not specified, is inferred from the directory name
rate = "5m" -- Valid values are xm xh where x is the number of minutes/hours you wish to run the script. Default is 5m
message = "The message of your failed check" -- Default is inferred from the directory name
disabled = true -- Whether or not we should run this check -- Default is false
```

**Real world example:**

```
name = "Low Battery"
rate = "5m"
message = "Your laptop has low battery. Consider charging it."
```

## Beginning the service

`check-republic` is a service itself and needs to constantly be running in order to alert of issues when they arise.
Start the service with

```
sudo systemctl enable check-republic
```

## Why?

Not all desktop environments or window managers have out of the box notifications and alerts. 
i3 strives for simplicity and minimalism at the expense of notifying and alerting. 
Often (for me anyway) the problem is discovered too late (`i3status` is not always enough).

## CLI

Whilsy `check-republic` is a service that runs scripts and alerts on them, there is also the `check-republic` CLI
which gives you insight into the checks.

```
check-republic 

-l, --list    List all checks

```

## TODO 

- Ability to disable checks (add a `disabled` file and that will bypass the check?)
- Have checks ran at a specific interval
- 
