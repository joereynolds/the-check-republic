local M = {}

local function get_default()
    return {
        name = "A check has failed",
        duration = "5m",
        message = "Check your system",
        disabled = false
    }
end

-- Get the configuration file
-- Falls back to a default if non exists
function M.get()
    return get_default()
end

return M
