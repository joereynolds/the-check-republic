local lfs = require "lfs"
local util = require "util"

local M = {
    location = os.getenv("HOME")
        .. util.separator .. ".config"
        .. util.separator .. "check-republic"
        .. util.separator .. "config.lua"
}

local function get_default()
    return {
        name = "A check has failed",
        rate = "5m",
        message = "Check your system",
        disabled = false
    }
end

-- Get check-republic's config file (if it's there)
function M.get(config_file)
    if config_file ~= nil and lfs.attributes(config_file) ~= nil then
        return dofile(config_file)
    end

    return { notifier = 'notify-send' }
end

-- Get the configuration file
-- Falls back to a default if non exists
function M.get_check_config(check_config_file)
    if check_config_file ~= nil and lfs.attributes(check_config_file) ~= nil then
        local check_config = dofile(check_config_file)

        -- Provide sensible defaults for values not supplied
        check_config["name"] = check_config["name"] or check_config_file
        check_config["message"] = check_config["message"] or "This check has failed."
        check_config["level"] = check_config["level"] or "normal"

        return check_config
    end

    return get_default()
end

return M
