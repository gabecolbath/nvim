local dependencies = {
    "nvim-tree/nvim-web-devicons",
}
local opts = {
    options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = { "Oil", "Outline", "Telescope" },
        }
    },
    sections = {
        lualine_a = {
            {
                "buffers",
                show_filename_only = true,
                hide_filename_extension  = false,
                show_modified_status = true,
                mode = 0,
                max_length = vim.o.columns * 2 / 3,
                filetype_names = {
                    TelescopePrompt = "Telescope",
                    alpha = "Alpha",
                },
                use_mode_colors = false,
                symbols = {
                    modified = " ",
                    alternate_file = " ",
                },
                padding = 2,
            },
        },
        lualine_b = {
        },
        lualine_c = {},
        lualine_x = {
            {
                "branch",
                icon = "",
            },
            {
                "diff",
            },
            {
                "filetype",
                colored = true,
                icon_only = false,
                icon = { align = "left" },
                padding = 1,
            },
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
            }
        },
        lualine_y = {
            "mode",
            "location",
            "progress",
        },
        lualine_z = {
            {
                "datetime",
                style = "%a %b %-d %-I:%M %p",
            },
        },
    },
}

return {
    opts = opts,
    dependencies = dependencies,
}
