local M = {}

local usage = [[
Usage: check-republic SUBCOMMAND
Example: check-republic install
CLI helper for the check-republic daemon
Options:
  -h, --help  Display this help
Available commands:
  help     Display this help
  install  Install the check-republic service and daemon
  list     List all checks
  run      Run all checks]]

function M.process()
    print(usage)
end

return M
