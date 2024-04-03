local check = require "check"
local lfs = require "lfs"
local colours = require "terminal-colours"

local M = {}

function M.process()
    if lfs.attributes(check.directory) == nil then
        return print("No checks found in " .. check.directory)
    end

    for file in lfs.dir(check.directory) do
        if file ~= '.' and file ~= '..' then
            io.write(colours.green .. file .. colours.reset)
            local check_files = check.directory .. '/' .. file .. '/'

            for check_file in lfs.dir(check_files) do
                if check_file == 'description' then
                    local description = io.open(check_files .. check_file):read("*a")
                    io.write(' - ' .. description)
                end
            end
        end
    end
    print()
end

return M

