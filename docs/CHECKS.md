Checks live under `~/.config/check-republic/checks`.  Each check has a
directory containing the check itself and a configuration file for that check.

For example, a "low battery" check would have the following structure:

```
.config/
└── check-republic/
    └── checks
        └── low-battery
            ├── check
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

## Check configuration (config.lua)

Each check has a config file that can dictate various things about the check.
The configuration files are lua files (lua tables, more accurately) but you
don't need to be a lua maestro to configure a check.

```
return {
    -- The name of the check
    -- Default is inferred from the directory's name
    name = "the name of my check",

    -- The description of what this check does
    -- This will be displayed when you call
    --   check-republic list
    description = "The description of my check"

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
    description = "Alerts when your battery is < 10%",
    name = "Low Battery",
    rate = "5m",
    message = "Your laptop has low battery. Consider charging it."
}
```
