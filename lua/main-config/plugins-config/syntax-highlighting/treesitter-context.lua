
--  88888888888                                d8b 888    888                    
--      888                                    Y8P 888    888                    
--      888                                        888    888                    
--      888  888d888 .d88b.   .d88b.  .d8888b  888 888888 888888 .d88b.  888d888 
--      888  888P"  d8P  Y8b d8P  Y8b 88K      888 888    888   d8P  Y8b 888P"   
--      888  888    88888888 88888888 "Y8888b. 888 888    888   88888888 888     
--      888  888    Y8b.     Y8b.          X88 888 Y88b.  Y88b. Y8b.     888     
--      888  888     "Y8888   "Y8888   88888P' 888  "Y888  "Y888 "Y8888  888     
--                                                                               
--                                                                               
--                                                                               
--   .d8888b.                    888                     888                     
--  d88P  Y88b                   888                     888                     
--  888    888                   888                     888                     
--  888         .d88b.  88888b.  888888 .d88b.  888  888 888888                  
--  888        d88""88b 888 "88b 888   d8P  Y8b `Y8bd8P' 888                     
--  888    888 888  888 888  888 888   88888888   X88K   888                     
--  Y88b  d88P Y88..88P 888  888 Y88b. Y8b.     .d8""8b. Y88b.                   
--   "Y8888P"   "Y88P"  888  888  "Y888 "Y8888  888  888  "Y888                 

local opts = {
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

return {
    opts = opts,
}
