
--  888      .d8888b.  8888888b.        .d8888b.                     .d888 d8b          
--  888     d88P  Y88b 888   Y88b      d88P  Y88b                   d88P"  Y8P          
--  888     Y88b.      888    888      888    888                   888                 
--  888      "Y888b.   888   d88P      888         .d88b.  88888b.  888888 888  .d88b.  
--  888         "Y88b. 8888888P"       888        d88""88b 888 "88b 888    888 d88P"88b 
--  888           "888 888             888    888 888  888 888  888 888    888 888  888 
--  888     Y88b  d88P 888             Y88b  d88P Y88..88P 888  888 888    888 Y88b 888 
--  88888888 "Y8888P"  888              "Y8888P"   "Y88P"  888  888 888    888  "Y88888 
--                                                                                  888 
--                                                                             Y8b d88P 
--                                                                              "Y88P" 

local event = {
    "BufReadPre",
    "BufNewFile",
}

local init = function()
end

local config = function()
    local windows = require("lspconfig.ui.windows")
    windows.default_options.border = "single"
    vim.diagnostic.config({
        signs = true,
        underline = false,
        virtual_text = false,
        virtual_lines = false,
        update_in_insert = false,
        float = {
            header = false,
            border = "single",
            focusable = true,
        },
    })
    local signs = { Error = "!", Warn = "󰈻", Hint = "󰌵", Info = "i" }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

return {
    event = event,
    init = init,
    config = config,
}
