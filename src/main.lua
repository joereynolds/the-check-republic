#!/usr/bin/env lua
local commands = require "subcommands/subcommands"
local subcommand = arg[1]

if not subcommand or subcommand == '--help' or subcommand == '-h' then
    commands.help.process()
end

for command, _ in pairs(commands) do
    if command == subcommand then
        return commands[command].process()
    end
end
