
--   .d8888b.                                                         888    
--  d88P  Y88b                                                        888    
--  888    888                                                        888    
--  888         .d88b.  88888b.d88b.  88888b.d88b.   .d88b.  88888b.  888888 
--  888        d88""88b 888 "888 "88b 888 "888 "88b d8P  Y8b 888 "88b 888    
--  888    888 888  888 888  888  888 888  888  888 88888888 888  888 888    
--  Y88b  d88P Y88..88P 888  888  888 888  888  888 Y8b.     888  888 Y88b.  
--   "Y8888P"   "Y88P"  888  888  888 888  888  888  "Y8888  888  888  "Y888

local opts = {
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
}

local lazy = false

return {
    opts = opts,
    lazy = lazy,
}
