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
        └── message
```

Note the `check.sh` file. This is where our check is performed. It can be in any language.
As long as you return the appropriate exit code (0 for success, 1 for failure), `check-republic` will know what to do.
**Naming is important**. Your check files _must_ begin with "check" and your message file _must_ be called "message".
Try and make the check names as descriptive as possible. It will help you in the long run.

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
