local service = require "service"

local M = {}

function M.process()
    print("Writing service file...")
    service.write(
        service.get_user(),
        service.get_display(),
        service.get_xauthority(),
        service.get_dbus(),
        service.get_exec_start()
    )
    print("Service file written to " .. service.output_path)

    print("Moving service file and timer to /etc/systemd/system")
    os.execute("sudo mv " .. service.output_path .. " /etc/systemd/system/")
    os.execute("sudo cp ../systemd/check-republic.timer /etc/systemd/system/")

    print("Moving executable to /usr/local/bin")
    os.execute("sudo cp ../dist/check-republicd /usr/local/bin/")

    print("Enabling service")
    os.execute("sudo systemctl enable check-republic.timer")

    print("Starting service's timer")
    os.execute("sudo systemctl start check-republic.timer")

    print("setup complete")
end

return M
