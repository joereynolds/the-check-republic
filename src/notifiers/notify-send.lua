local M = {}

function M.get_notify_command(name, message)
    return "notify-send " .. "'" .. name .. "'" .. " '" .. message .. "'"
end

return M
