#!/usr/bin/env lua
local lfs = require "lfs"
local config = require "./src/config"
local notifier = require "./src/notifiers/notify-send"


local path_separator = package.config:sub(1,1)
local check_directory = os.getenv("HOME")
    .. path_separator ..".config"
    .. path_separator .. "check-republic"
    .. path_separator .. "checks"

local check_directory_attributes = lfs.attributes(check_directory)

if check_directory_attributes == nil then
    print("No check directory found.")
    print("I couldn't find " .. check_directory)
    print("Do this:")
    print("mkdir -p " .. check_directory)
    os.exit(false)
end

for file in lfs.dir(check_directory) do
    if file ~= '.' and file ~= '..' then
        local config_file = check_directory .. path_separator .. file .. path_separator .. "config.lua"
        local check_file = check_directory .. path_separator .. file .. path_separator .. "check"
        local check_config = config.get(config_file)

        if not check_config["disabled"] then
            if not os.execute(check_file) then
                os.execute(notifier.get_notify_command(check_config["name"], check_config["message"]))
            end
        end
    end
end
