local mason_registry = require("mason-registry")
local python_path = mason_registry.get_package("debugpy"):get_install_path() .. "/venv/bin/python"

local dap = require "dap"
dap.adapters.python = {
    type = "executable",
    command = python_path,
    args = {
        "-m",
        "debugpy.adapter",
    },
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}", -- This configuration will launch the current file if used.
    },
}
