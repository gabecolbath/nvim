
--  888b     d888                                                                   
--  8888b   d8888                                                                   
--  88888b.d88888                                                                   
--  888Y88888P888  8888b.  .d8888b   .d88b.  88888b.                                
--  888 Y888P 888     "88b 88K      d88""88b 888 "88b                               
--  888  Y8P  888 .d888888 "Y8888b. 888  888 888  888      888888                   
--  888   "   888 888  888      X88 Y88..88P 888  888                               
--  888       888 "Y888888  88888P'  "Y88P"  888  888                               
--                                                                                  
--                                                                                  
--                                                                                  
--  888                             .d8888b.                     .d888 d8b          
--  888                            d88P  Y88b                   d88P"  Y8P          
--  888                            888    888                   888                 
--  888     .d8888b  88888b.       888         .d88b.  88888b.  888888 888  .d88b.  
--  888     88K      888 "88b      888        d88""88b 888 "88b 888    888 d88P"88b 
--  888     "Y8888b. 888  888      888    888 888  888 888  888 888    888 888  888 
--  888          X88 888 d88P      Y88b  d88P Y88..88P 888  888 888    888 Y88b 888 
--  88888888 88888P' 88888P"        "Y8888P"   "Y88P"  888  888 888    888  "Y88888 
--                   888                                                        888 
--                   888                                                   Y8b d88P 
--                   888                                                    "Y88P" 

local opts = {
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
    -- This setting has no relation with the `automatic_installation` setting.
    ---@type string[]
    ensure_installed = {},

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    ---@type boolean
    automatic_installation = false,

    -- See `:h mason-lspconfig.setup_handlers()`
    ---@type table<string, fun(server_name: string)>?
    handlers = nil,
}

return {
    opts = opts,
}
