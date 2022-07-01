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

    it("creates a service file given some parameters", function()
        local expected = [[
[Unit]
Description="Check Republic Service"
[Service]
User=joe
Type=oneshot
Environment="DISPLAY=:0"
Environment="XAUTH=/bla/bla"
Environment="DBUS=/blabla"
ExecStart="/home/joe/bin/check-republicd"]]

        local actual = service.make_service_file(
            "joe",
            "DISPLAY=:0",
            "XAUTH=/bla/bla",
            "DBUS=/blabla",
            "/home/joe/bin/check-republicd"
        )

        assert.are.equal(expected, actual)
    end)
end)
