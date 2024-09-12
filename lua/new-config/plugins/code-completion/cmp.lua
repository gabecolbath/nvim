local config = function()
    local cmp = require("cmp")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local snip = require("luasnip")
    local default_mapping = {
            ["<C-j>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
            ["<C-k>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,
            ["<C-n>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
            ["<C-p>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,
            ["<C-l>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = false,
            }),
        }

    cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
    )

    cmp.setup({
        snippet = {
            expand = function(args)
                snip.lsp_expand(args.body)
            end,
        },
        sources = {
            { name = "nvim_lsp", max_item_count = 5 },
            { name = "luasnip", max_item_count = 5 },
            { name = "path", max_item_count = 5 },
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
        mapping = default_mapping,
        experimental = {
            native_menu = false,
            ghost_text = false,
        },
    })

    cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            {
                name = "cmdline",
                option = {
                    ignore_cmds = { "Man", "!" },
                },
            },
        })
    })
end

return {
    config = config
}
