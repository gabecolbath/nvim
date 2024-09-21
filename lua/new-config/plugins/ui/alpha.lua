--          ┌─────────────────────────────────────────────────────────┐
--          │                   Alpha Configuration                   │
--          └─────────────────────────────────────────────────────────┘

local dependencies = { "echasnovski/mini.icons", "nvim-lua/plenary.nvim" }
local config = function ()
    local alpha = require("alpha")
    local startify = require("alpha.themes.startify")

    startify.section.header.val = {
        [[                  __..--''``---....___   _..._    __          ]],
        [[    /// //_.-'    .-/";  `        ``<._  ``.''_ `. / // /     ]],
        [[   ///_.-' _..--.'_    \                    `( ) ) // //      ]],
        [[   / (_..-' // (< _     ;_..__               ; `' / ///       ]],
        [[    / // // //  `-._,_)' // / ``--...____..-' /// / //        ]],
    }

    startify.section.header.opts.position = "center"

    alpha.setup(startify.config)
end

return {
    dependencies = dependencies,
    config = config,
}
