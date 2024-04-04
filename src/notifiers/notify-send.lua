local M = {}

function M.get_notify_command(name, message, level)
    return "notify-send --urgency " .. level .. " '" .. name .. "'" .. " '" .. message .. "'"
end

return M
