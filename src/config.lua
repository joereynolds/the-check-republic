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
    if config_file ~= nil and lfs.attributes(config_file) ~= nil then
        local check_config = dofile(config_file)

        -- Provide sensible defaults for values not supplied
        check_config["name"] = check_config["name"] or config_file
        check_config["message"] = check_config["message"] or "This check has failed."
        return check_config
    end

    return get_default()
end

return M
