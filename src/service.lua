-- Writes out some environment variables
-- that are required for the .service
-- files to work
local M = {}

function M.get_display()
    return "DISPLAY=:0"
end

function M.get_user()
    return os.getenv("USERNAME")
end

-- Pass in the key and value and
-- get back the correctly
-- escaped string
function M.make_option(key, value)
    return key .. '=' .. '"' .. value .. '"'
end

function M.make_service_file(user, display, xauthority, dbus, exec_start)
    local service_file = "[Unit]" .. "\n"

    service_file = service_file .. M.make_option("Description", "Check Republic Service") .. "\n"

    service_file = service_file .. "[Service]" .. "\n"
    service_file = service_file .. M.make_option("User", user) .. "\n"
    service_file = service_file .. M.make_option("Type", "oneshot") .. "\n"
    service_file = service_file .. M.make_option("Environment", display) .. "\n"
    service_file = service_file .. M.make_option("Environment", xauthority) .. "\n"
    service_file = service_file .. M.make_option("Environment", dbus) .. "\n"
    service_file = service_file .. M.make_option("ExecStart", exec_start)

    return service_file
end

-- function M.write_service_file(user, display, xauthority, dbus, exec_start)
    -- local service_file = M.make_service_file(user, display, xauthority, dbus, exec_start)
    -- ...
-- end

return M
