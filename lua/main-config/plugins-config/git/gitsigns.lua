
--   .d8888b.  d8b 888          .d8888b.  d8b                            
--  d88P  Y88b Y8P 888         d88P  Y88b Y8P                            
--  888    888     888         Y88b.                                     
--  888        888 888888       "Y888b.   888  .d88b.  88888b.  .d8888b  
--  888  88888 888 888             "Y88b. 888 d88P"88b 888 "88b 88K      
--  888    888 888 888               "888 888 888  888 888  888 "Y8888b. 
--  Y88b  d88P 888 Y88b.       Y88b  d88P 888 Y88b 888 888  888      X88 
--   "Y8888P88 888  "Y888       "Y8888P"  888  "Y88888 888  888  88888P' 
--                                                 888                   
--                                            Y8b d88P                   
--                                             "Y88P"                    

local opts = {
    signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        follow_files = true
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    yadm = {
        enable = false
    },
}

return {
    opts = opts,
}
