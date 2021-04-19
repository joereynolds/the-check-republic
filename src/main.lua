#!/usr/bin/env lua
local lfs = require "lfs"
local check = require "./src/check"

local check_directory_attributes = lfs.attributes(check.directory)

if check_directory_attributes == nil then
    print("No check directory found.")
    print("I couldn't find " .. check.directory)
    print("Do this:")
    print("mkdir -p " .. check.directory)
    os.exit(false)
end

for file in lfs.dir(check.directory) do
    if file ~= '.' and file ~= '..' then
        check.run(file)
    end
end
