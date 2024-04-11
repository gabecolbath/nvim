
--   .d8888b.  888b     d888 8888888b.  
--  d88P  Y88b 8888b   d8888 888   Y88b 
--  888    888 88888b.d88888 888    888 
--  888        888Y88888P888 888   d88P 
--  888        888 Y888P 888 8888888P"  
--  888    888 888  Y8P  888 888        
--  Y88b  d88P 888   "   888 888        
--   "Y8888P"  888       888 888       

local config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        window = {
            completion = cmp.config.window.bordered({
                border = "single",
                scrollbar = false,
                scrolloff = 5,
            }),
            documentation = cmp.config.window.bordered({
                border = "single",
                scrollbar = false,
            }),
        },
        sources = cmp.config.sources({
            { name = "nvim_lsp", max_item_count = 5 },
            { name = "luasnip", max_item_count = 5 },
            { name = "nvim_lsp_signature_help" },
        }, {
            { name = "buffer", keyword_length = 3, max_item_count = 5 },
            { name = "path", max_item_count = 5 },
        }),
        formatting = {
            format = lspkind.cmp_format({
                with_text = true,
                menu = {
                    buffer = "BUFF",
                    nvim_lsp = "NLSP",
                    path = "PATH",
                    luasnip = "SNIP",
                },
            }),
        },
        experimental = {
            native_menu = false,
            ghost_text = false,
        },
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
            { name = 'buffer' },
        })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
    })

    -- Set up lspconfig.
    -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
        -- capabilities = capabilities
    -- }
end

return {
    config = config,
}

