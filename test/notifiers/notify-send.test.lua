local luaunit = require "luaunit"
local notify_send = require "../../src/notifiers/notify-send"

function test_the_command_is_built_correctly()
    local expected = "notify-send"
    local actual = notify_send.get_notify_command()

    luaunit.assertEquals(actual, expected)
end

os.exit(luaunit.LuaUnit.run())
