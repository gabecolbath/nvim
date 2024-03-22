
--  888    888                                                      
--  888    888                                                      
--  888    888                                                      
--  8888888888  8888b.  888d888 88888b.   .d88b.   .d88b.  88888b.  
--  888    888     "88b 888P"   888 "88b d88""88b d88""88b 888 "88b 
--  888    888 .d888888 888     888  888 888  888 888  888 888  888 
--  888    888 888  888 888     888 d88P Y88..88P Y88..88P 888  888 
--  888    888 "Y888888 888     88888P"   "Y88P"   "Y88P"  888  888 
--                              888                                 
--                              888                                 
--                              888                                

local opts = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,

    -- enable tabline with harpoon marks
    tabline = false,
    tabline_prefix = "   ",
    tabline_suffix = "   ",

    projects = {
        -- Yes $HOME works
        ["$HOME/personal/vim-with-me/server"] = {
            term = {
                cmds = {
                    "./env && npx ts-node src/index.ts"
                }
            }
        }
    },

    -- menu = {
    --     width = vim.api.nvim_win_get_width(0) - 4,
    -- }
}

return {
    opts = opts,
}
