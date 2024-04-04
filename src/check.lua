local config = require "config"
local util = require "util"
local lfs = require "lfs"

local M = {
    directory = os.getenv("HOME")
        .. util.separator ..".config"
        .. util.separator .. "check-republic"
        .. util.separator .. "checks"
}

function M.run(file)
    local each_check_dir = M.directory .. util.separator .. file .. util.separator
    local config_file = each_check_dir .. "config.lua"
    local check_file = each_check_dir .. "check"
    local check_config = config.get_check_config(config_file)

    -- Get the notifier from the user's config
    local notifier = require("notifiers/" .. config.get(config.location)["notifier"] or 'notify-send')

    if lfs.attributes(check_file) == nil then
        print("No valid check file in " .. each_check_dir)
        return
    end

    if not check_config["disabled"] and not os.execute(check_file) then
        os.execute(
            notifier.get_notify_command(
                check_config["name"],
                check_config["message"],
                check_config["level"]
            )
        )
    end
end

return M
