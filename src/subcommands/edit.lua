local check = require "check"

local M = {}

function M.process()
    if arg[2] == nil then
        print("Specify a check to edit.")
        print("Example:")
        print("  check-republic edit low-battery")
        return
    end

    file_to_edit = check.directory .. '/' .. arg[2] .. '/' .. 'check'
    os.execute("$EDITOR " .. file_to_edit)
end

return M
