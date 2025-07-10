return {
    "rmagatti/auto-session",
    config = function()
        local auto_session = require("auto-session")
        auto_session.setup({
            auto_restore_enabled = false,
            auto_session_suppress_dirs = { "~", "~/Dev", "~/Downloads", "~/Documents", "~/Desktop" },
        })

        vim.api.nvim_create_autocmd({ "User" }, {
            pattern = "SessionLoadPost",
            callback = function ()
                require("vuffers").on_session_loaded()
            end
        })
    end
}
