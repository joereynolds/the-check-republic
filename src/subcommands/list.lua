local check = require "check"
local lfs = require "lfs"
local colours = require "terminal-colours"
local config = require "config"

local M = {}

function M.process()
    if lfs.attributes(check.directory) == nil then
        return print("No checks found in " .. check.directory)
    end

    for file in lfs.dir(check.directory) do
        if file ~= '.' and file ~= '..' then
            io.write(colours.green .. file .. colours.reset)
            local check_files = check.directory .. '/' .. file .. '/'

            local c = config.get_check_config(check_files .. 'config.lua')

            if c.description ~= nil then
                io.write(' - ' .. c.description)
            end

            print()
        end
    end
end

return M

