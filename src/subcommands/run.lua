local lfs = require "lfs"
local check = require "check"

local M = {}

local function add_last_ran_for_check(file)
    local check_specific_directory = check.directory .. '/' .. file .. '/'
    local ran = io.open(check_specific_directory .. '.ran-at', "w"):close()
end

function M.process()
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
            add_last_ran_for_check(file)
        end
    end
end

return M
