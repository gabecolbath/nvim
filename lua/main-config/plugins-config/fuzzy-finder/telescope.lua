
--  88888888888       888                                                               
--      888           888                                                               
--      888           888                                                               
--      888   .d88b.  888  .d88b.  .d8888b   .d8888b .d88b.   .d88b.  88888b.   .d88b.  
--      888  d8P  Y8b 888 d8P  Y8b 88K      d88P"   d8P  Y8b d88""88b 888 "88b d8P  Y8b 
--      888  88888888 888 88888888 "Y8888b. 888     88888888 888  888 888  888 88888888 
--      888  Y8b.     888 Y8b.          X88 Y88b.   Y8b.     Y88..88P 888 d88P Y8b.     
--      888   "Y8888  888  "Y8888   88888P'  "Y8888P "Y8888   "Y88P"  88888P"   "Y8888  
--                                                                    888               
--                                                                    888               
--                                                                    888              

local branch = "0.1.x"

local dependencies = {
    "nvim-lua/plenary.nvim",
}

local opts = {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
            --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    },
}

return {
    branch = branch,
    dependencies = dependencies,
    opts = opts,
}
