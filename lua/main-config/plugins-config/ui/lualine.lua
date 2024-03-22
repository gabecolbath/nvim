
--  888                       888 d8b                   
--  888                       888 Y8P                   
--  888                       888                       
--  888     888  888  8888b.  888 888 88888b.   .d88b.  
--  888     888  888     "88b 888 888 888 "88b d8P  Y8b 
--  888     888  888 .d888888 888 888 888  888 88888888 
--  888     Y88b 888 888  888 888 888 888  888 Y8b.     
--  88888888 "Y88888 "Y888888 888 888 888  888  "Y8888  

local dependencies = {
    "nvim-tree/nvim-web-devicons",
}

local opts = {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

return {
    dependencies = dependencies,
    opts = opts,
}
