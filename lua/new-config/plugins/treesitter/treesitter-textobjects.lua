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
                    -- Assignments
                    ["a="] = { query = "@assignment.outer", desc = "Assignment" },
                    ["i="] = { query = "@assignment.inner", desc = "Assignment" },
                    ["l="] = { query = "@assignment.lhs", desc = "Assignment" },
                    ["r="] = { query = "@assignment.rhs", desc = "Assignment" },
                    -- Arguments
                    ["aa"] = { query = "@parameter.outer", desc = "Parameter" },
                    ["ia"] = { query = "@parameter.inner", desc = "Paramter" },
                    -- Conditionals
                    ["ai"] = { query = "@conditional.outer", desc = "Conditional" },
                    ["ii"] = { query = "@conditional.inner", desc = "Conditional" },
                    -- Loops
                    ["al"] = { query = "@loop.outer", desc = "Loop" },
                    ["il"] = { query = "@loop.inner", desc = "Loop" },
                    -- Function Call
                    ["afc"] = { query = "@call.outer", desc = "Function Call" },
                    ["ifc"] = { query = "@call.inner", desc = "Function Call" },
                    -- Function Definition
                    ["aff"] = { query = "@function.outer", desc = "Function Definition" },
                    ["iff"] = { query = "@function.inner", desc = "Function Definition" },
                    -- Class
                    ["ac"] = { query = "@class.outer", desc = "Class" },
                    ["ic"] = { query = "@class.inner", desc = "Class" },
                },
            },
<<<<<<< HEAD
            swap = {
                enable = true,
                swap_next = {
                    -- Parameter
                    ["<leader>sna"] = { query = "@parameter.inner", desc = "Parameter" },
                    -- Function
                    ["<leader>snf"] = { query = "@function.outer", desc = "Function" },
                    -- Assignment
                    ["<leader>sn="] = { query = "@assignment.outer", desc = "Assignment" },
                },
                swap_previous = {
                    -- Parameters 
                    ["<leader>spa"] = { query = "@parameter.inner", desc = "Parameter" },
                    -- Function Definitions
                    ["<leader>spf"] = { query = "@function.outer", desc = "Function" },
                    -- Assignments
                    ["<leader>sp="] = { query = "@assignment.outer", desc = "Assignment" },
                },
            },
=======
>>>>>>> b558434 (Not sure)
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    -- Function Calls
                    ["]fc"] = { query = "@call.outer", desc = "Function Call" },
                    -- Function Definitions
                    ["]ff"] = { query = "function.outer", desc = "Function Definition" },
                    -- Classes
                    ["]c"] = { query = "class.outer", desc = "Class" },
                    -- Conditionals
                    ["]i"] = { query = "conditional.outer", desc = "Conditional" },
                    -- Loops
                    ["]l"] = { query = "loop.outer", desc = "Loop" },
                    -- Scope
                    ["]s"] = { query = "@scope", query_group = "locals", desc = "Scope" },
                },
                goto_previous_start = {
                    -- Function Calls
                    ["[fc"] = { query = "@call.outer", desc = "Function Call" },
                    -- Function Definitions
                    ["[ff"] = { query = "function.outer", desc = "Function Definition" },
                    -- Classes
                    ["[c"] = { query = "class.outer", desc = "Class" },
                    -- Conditionals
                    ["[i"] = { query = "conditional.outer", desc = "Conditional" },
                    -- Loops
                    ["[l"] = { query = "loop.outer", desc = "Loop" },
                },
                goto_next_end = {
                    -- Function Calls
                    ["]FC"] = { query = "@call.outer", desc = "Function Call" },
                    -- Function Definitions
                    ["]FF"] = { query = "function.outer", desc = "Function Definition" },
                    -- Classes
                    ["]C"] = { query = "class.outer", desc = "Class" },
                    -- Conditionals
                    ["]I"] = { query = "conditional.outer", desc = "Conditional" },
                    -- Loops
                    ["]L"] = { query = "loop.outer", desc = "Loop" },
                    -- Scope
                    ["]S"] = { query = "@scope", query_group = "locals", desc = "Scope" },
                },
                goto_previous_end = {
                    -- Function Calls
                    ["[FC"] = { query = "@call.outer", desc = "Function Call" },
                    -- Function Definitions
                    ["[FF"] = { query = "function.outer", desc = "Function Definition" },
                    -- Classes
                    ["[C"] = { query = "class.outer", desc = "Class" },
                    -- Conditionals
                    ["[I"] = { query = "conditional.outer", desc = "Conditional" },
                    -- Loops
                    ["[L"] = { query = "loop.outer", desc = "Loop" },
                    -- Scope
                    ["[S"] = { query = "@scope", query_group = "locals", desc = "Scope" },
                },
            },
            lsp_interop = {
                enable = true,
                border = "single",
                peek_definition_code = {
                    ["<leader>if"] = { query = "@function.outer", desc = "Function Definition" },
                    ["<leader>ic"] = { query = "@class.outer", desc = "Class" },
                }
            }
        },
    })
end

return {
    dependencies = dependencies,
    config = config,
}
