local config = require "../src/config"

describe("The config module", function()
    it("has a config which falls back to defaults if no file is found", function()
        local expected = {
            name = "A check has failed",
            rate = "5m",
            message = "Check your system",
            disabled = false
        }

        local actual = config.get_check_config()
        assert.are.same(expected, actual)
    end)

    it("has a sensible default for the 'name' parameter", function()
        local expected = "./spec/empty-config.lua"
        local actual = config.get_check_config("./spec/empty-config.lua")["name"]
        assert.are.same(expected, actual)
    end)

    it("has a sensible default for the 'message' parameter", function()
        local expected = "This check has failed."
        local actual = config.get_check_config("./spec/empty-config.lua")["message"]
        assert.are.same(expected, actual)
    end)

    it("falls back to notify-send if no top level config is found", function()
        local expected = {
            notifier = 'notify-send'
        }
        local actual = config.get()

        assert.are.same(expected, actual)
    end)
end)
