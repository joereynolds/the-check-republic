local luaunit = require "luaunit"
local notify_send = require "../../src/notifiers/notify-send"

function test_the_command_is_built_correctly()
    local expected = "notify-send --urgency critical 'low battery' 'charge your laptop'"
    local actual = notify_send.get_notify_command(
        "low battery",
        "charge your laptop",
        "critical"
    )

    luaunit.assertEquals(actual, expected)
end

os.exit(luaunit.LuaUnit.run())
