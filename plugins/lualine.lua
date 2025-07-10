return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function ()
        local lualine = require("lualine")
        local theme = {
            normal = {
                a = "@comment.note",
                b = "Comment",
                c = "Comment",
            },
            insert = {
                a = "@comment.todo",
                b = "Comment",
                c = "Comment",
            },
            visual = {
                a = "@comment.hint",
                b = "Comment",
                c = "Comment",
            },
            replace = {
                a = "@comment.info",
                b = "Comment",
                c = "Comment",
            },
            command = {
                a = "@diff.minus",
                b = "Comment",
                c = "Comment",
            },
            inactive = {
                a = "@diff.delta",
                b = "Comment",
                c = "Comment",
            },
        }

        lualine.setup({
            options = {
                theme = theme,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },

                disabled_filetypes = {
                    statusline = { "Oil", "Outline", "Telescope", "alpha", "vuffers" },
                }
            },
            sections = {
                lualine_a = {
                    {
                        "filename",
                        file_status = true,
                        newfile_status = false,
                        path = 1,
                        shorting_target = 40,
                        symbols = {
                            modified = "",

                            readonly = "",
                            unnamed = "?",

                            newfile = "+",
                        },
                        padding = 2,
                    },
                },
                lualine_b = {
                    {
                        "filetype",

                        colored = false,
                        icon_only = false,
                        icon = { align = "left" },
                        padding = 1,
                    },
                    {
                        "branch",
                        icon = "",
                    },

                    {
                        "diff",
                        colored = false,
                    },
                },
                lualine_c = {},
                lualine_x = {},

                lualine_y = {
                    { "location" },
                    { "mode" },

                },
                lualine_z = {
                    {
                        "datetime",
                        style = "%a %b %-d %-I:%M %p",
                    },
                },
            },
        })
    end
}
