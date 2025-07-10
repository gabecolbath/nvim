local dap = require("dap")
local path = vim.fn.stdpath("data") .. "/mason/bin/"

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = path .. "codelldb",
        args = { "--port", "${port}" },
    },
}

dap.configurations.zig = {
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}
