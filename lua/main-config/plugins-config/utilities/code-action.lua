
--   .d8888b.                888                      d8888          888    d8b                   
--  d88P  Y88b               888                     d88888          888    Y8P                   
--  888    888               888                    d88P888          888                          
--  888         .d88b.   .d88888  .d88b.           d88P 888  .d8888b 888888 888  .d88b.  88888b.  
--  888        d88""88b d88" 888 d8P  Y8b         d88P  888 d88P"    888    888 d88""88b 888 "88b 
--  888    888 888  888 888  888 88888888        d88P   888 888      888    888 888  888 888  888 
--  Y88b  d88P Y88..88P Y88b 888 Y8b.           d8888888888 Y88b.    Y88b.  888 Y88..88P 888  888 
--   "Y8888P"   "Y88P"   "Y88888  "Y8888       d88P     888  "Y8888P  "Y888 888  "Y88P"  888  888 

local cmd = "CodeActionMenu"

local config = function()
    vim.g.code_action_menu_window_border = 'single'
    -- vim.g.code_action_menu_show_details = false
    -- vim.g.code_action_menu_show_diff = false
    -- vim.g.code_action_menu_show_action_kind = false
end

return {
    cmd = cmd,
    config = config,
}
