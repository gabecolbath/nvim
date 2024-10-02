--          ┌─────────────────────────────────────────────────────────┐
--          │          Treesitter Text Objects Configuration          │
--          └─────────────────────────────────────────────────────────┘

local dependencies = { "nvim-treesitter/nvim-treesitter" }
local config = function()
    local ts_configs = require("nvim-treesitter.configs")
    ts_configs.setup({
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = { query = "@function.outer", desc = "function" },
                    ["if"] = { query = "@function.inner", desc = "function" },
                    ["ac"] = { query = "@class.outer", desc = "class" },
                    ["ic"] = { query = "@class.inner", desc = "class" },
                    ["as"] = { query = "@scope.outer", query_group = "locals", desc = "scope" },
                    ["is"] = { query = "@scope.inner", query_group = "locals", desc = "scope" },
                    ["aa"] = { query = "@parameter.outer", desc = "parameter" },
                    ["vn"] = { query = "@assignment.lhs", desc = "parameter" },
                    ["v="] = { query = "@assignment.rhs", desc = "parameter" },
                    ["a?"] = { query = "@conditional.outer", desc = "conditional" },
                    ["i?"] = { query = "@conditional.inner", desc = "conditional" },
                    ["al"] = { query = "@loop.outer", desc = "loop" },
                    ["il"] = { query = "@loop.inner", desc = "loop" },
                },
                -- You can choose the select mode (default is charwise 'v')
                --
                -- Can also be a function which gets passed a table with the keys
                -- * query_string: eg '@function.inner'
                -- * method: eg 'v' or 'o'
                -- and should return the mode ('v', 'V', or '<c-v>') or a table
                -- mapping query_strings to modes.
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>sna"] = { query = "@parameter.inner", desc = "Parameter" },
                },
                swap_previous = {
                    ["<leader>spa"] = { query = "@parameter.inner", desc = "Parameter" },
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]c"] = { query = "@class.outer", desc = "Next Class" },
                    ["]f"] = { query = "@function.outer", desc = "Next Function" },
                    ["]a"] = { query = "@parameter.outer", desc = "Next Parameter" },
                    ["]s"] = { query = "@scope", desc = "Next Scope" },
                    ["]="] = { query = "@assignment.rhs", desc = "Next Assignment" },
                    ["]v"] = { query = "@assignment.lhs", desc = "Next Assignment Name" },
                },
                goto_previous_start = {
                    ["[c"] = { query = "@class.outer", desc = "Next Class" },
                    ["[f"] = { query = "@function.outer", desc = "Next Function" },
                    ["[a"] = { query = "@parameter.outer", desc = "Next Parameter" },
                    ["[s"] = { query = "@scope", desc = "Next Scope" },
                    ["[="] = { query = "@assignment.rhs", desc = "Next Assignment" },
                    ["[v"] = { query = "@assignment.lhs", desc = "Next Assignment Name" },

                }
            }
        },
    })
end

return {
    dependencies = dependencies,
    config = config,
}
