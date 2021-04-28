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

return M
