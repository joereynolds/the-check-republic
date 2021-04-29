-- Writes out some environment variables
-- that are required for the .service
-- files to work
local M = {
    output_path = "/tmp/check-republic.service"
}

function M.get_display()
    return "DISPLAY=:0"
end

function M.get_user()
    return os.getenv("USERNAME")
end

function M.get_display()
    return "DISPLAY=" .. os.getenv("DISPLAY")
end

function M.get_xauthority()
    return "XAUTHORITY=" .. os.getenv("XAUTHORITY")
end

function M.get_dbus()
    return "DBUS_SESSION_BUS_ADDRESS=" .. os.getenv("DBUS_SESSION_BUS_ADDRESS")
end

function M.get_exec_start()
    -- TODO - Use path separators here
    return "/usr/local/bin/check-republicd"
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

    -- Note that these two are intentionally not using make_option so they're not quoted
    service_file = service_file .. "User=" .. user .. "\n"
    service_file = service_file .. "Type=oneshot" .. "\n"

    service_file = service_file .. M.make_option("Environment", display) .. "\n"
    service_file = service_file .. M.make_option("Environment", xauthority) .. "\n"
    service_file = service_file .. M.make_option("Environment", dbus) .. "\n"
    service_file = service_file .. M.make_option("ExecStart", exec_start)

    return service_file
end

function M.write(user, display, xauthority, dbus, exec_start)
    local service_file = M.make_service_file(user, display, xauthority, dbus, exec_start)
    local handle = io.open(M.output_path, "w")

    handle:write(service_file)
    handle:close()
end

return M
