local check = require "check"
local lfs = require "lfs"

local M = {}

function M.process()
    if lfs.attributes(check.directory) == nil then
        return print("No checks found")
    end

    for file in lfs.dir(check.directory) do
        if file ~= '.' and file ~= '..' then
            print(file)
        end
    end
end

return M

