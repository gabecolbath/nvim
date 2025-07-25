return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function() local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup({})

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        local wk = require("which-key")
        local keymaps = {
            { "<leader>d", group = "Debugger" },
            { "<leader>db", dap.toggle_breakpoint, desc = "Toggle Breakpoint " },
            { "<leader>dc", dap.continue, desc = "Continue" },
        }
        wk.add(keymaps)

    end,

}
