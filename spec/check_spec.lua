local check = require "../src/check"

describe("The check module", function()
    it("has a check directory predefined on the module", function()
        local expected = os.getenv("HOME") .. "/.config/check-republic/checks"
        local actual = check.directory

        assert.are.equal(expected, actual)
    end)
end)
