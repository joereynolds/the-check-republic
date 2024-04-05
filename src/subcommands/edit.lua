local check = require "check"

local M = {}

function M.process()
    if arg[2] == nil then
        print("Specify a check to edit.")
        print("Example:")
        print("  check-republic edit low-battery")
        return
    end

    check_file_to_edit = check.directory .. '/' .. arg[2] .. '/' .. 'check'
    config_file_to_edit = check.directory .. '/' .. arg[2] .. '/' .. 'config.lua'
    os.execute("$EDITOR " .. check_file_to_edit .. " " .. config_file_to_edit)
end

return M
