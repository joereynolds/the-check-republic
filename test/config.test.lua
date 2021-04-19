local luaunit = require "luaunit"
local config = require "../src/config"

function test_config_falls_back_to_a_default_if_no_config_exists()
    local expected = {
        name = "A check has failed",
        rate = "5m",
        message = "Check your system",
        disabled = false
    }

    local actual = config.get()

    luaunit.assertEquals(actual, expected)
end

function test_config_provides_a_sensible_default_for_name()
    local expected = "./test/empty-config.lua"
    local actual = config.get("./test/empty-config.lua")["name"]

    luaunit.assertEquals(actual, expected)
end

function test_config_provides_a_sensible_default_for_message()
    local expected = "This check has failed."
    local actual = config.get("./test/empty-config.lua")["message"]

    luaunit.assertEquals(actual, expected)
end

os.exit(luaunit.LuaUnit.run())
