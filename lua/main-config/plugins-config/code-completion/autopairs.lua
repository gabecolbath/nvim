
--         d8888          888                              d8b                  
--        d88888          888                              Y8P                  
--       d88P888          888                                                   
--      d88P 888 888  888 888888 .d88b.  88888b.   8888b.  888 888d888 .d8888b  
--     d88P  888 888  888 888   d88""88b 888 "88b     "88b 888 888P"   88K      
--    d88P   888 888  888 888   888  888 888  888 .d888888 888 888     "Y8888b. 
--   d8888888888 Y88b 888 Y88b. Y88..88P 888 d88P 888  888 888 888          X88 
--  d88P     888  "Y88888  "Y888 "Y88P"  88888P"  "Y888888 888 888      88888P' 
--                                       888                                    
--                                       888                                    
--                                       888                                   

local event = "InsertEnter"

local config = true

local opts = {
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    disable_in_macro = true,  -- disable when recording or executing a macro
    disable_in_visualblock = false, -- disable when insert after visual block mode
    disable_in_replace_mode = true,
    ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
    enable_moveright = true,
    enable_afterquote = true,  -- add bracket pairs after quote
    enable_check_bracket_line = true,  --- check bracket in same line
    enable_bracket_in_quote = true, --
    enable_abbr = false, -- trigger abbreviation
    break_undo = true, -- switch for basic rule break undo sequence
    check_ts = false,
    map_cr = true,
    map_bs = true,  -- map the <BS> key
    map_c_h = false,  -- Map the <C-h> key to delete a pair
    map_c_w = false, -- map <c-w> to delete a pair if possible
}

return {
    event = event,
    config = config,
    opts = opts,
}
