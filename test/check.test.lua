local luaunit = require "luaunit"
local check = require "../src/check"

function test_check_has_a_directory_already_set()
    local expected = os.getenv("HOME") .. "/.config/check-republic/checks"
    local actual = check.directory

    luaunit.assertEquals(actual, expected)
end

os.exit(luaunit.LuaUnit.run())
