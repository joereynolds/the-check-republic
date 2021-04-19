local lfs = require "lfs"
local M = {}

local function get_default()
    return {
        name = "A check has failed",
        rate = "5m",
        message = "Check your system",
        disabled = false
    }
end

-- Get the configuration file
-- Falls back to a default if non exists
function M.get(config_file)
    if config_file ~= nil then
        local check_config = dofile(config_file)
        return check_config
    end

    return get_default()
end

return M
