local service = require "../src/service"

describe("The check module", function()

    it("falls back to a display", function()
        local expected = "DISPLAY=:0"
        local actual = service.get_display()
        assert.are.equal(expected, actual)
    end)

    it("constructs key/values for the service file options", function()
        local expected = 'Environment="DISPLAY=:0"'
        local actual = service.make_option('Environment', 'DISPLAY=:0')
        assert.are.equal(expected, actual)
    end)
end)
