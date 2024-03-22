
--  88888888888                                d8b 888    888                    
--      888                                    Y8P 888    888                    
--      888                                        888    888                    
--      888  888d888 .d88b.   .d88b.  .d8888b  888 888888 888888 .d88b.  888d888 
--      888  888P"  d8P  Y8b d8P  Y8b 88K      888 888    888   d8P  Y8b 888P"   
--      888  888    88888888 88888888 "Y8888b. 888 888    888   88888888 888     
--      888  888    Y8b.     Y8b.          X88 888 Y88b.  Y88b. Y8b.     888     
--      888  888     "Y8888   "Y8888   88888P' 888  "Y888  "Y888 "Y8888  888     

local config = function()
    local treesitter_config = require("nvim-treesitter.configs")
    treesitter_config.setup {
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        -- List of parsers to ignore installing (or "all")
        ignore_install = { "javascript" },

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

        highlight = {
            enable = true,

            -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
            -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
            -- the name of the parser)
            -- list of language that will be disabled
            disable = { "c", "rust" },
            -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
            disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
    }
end

return {
    config = config,
}
