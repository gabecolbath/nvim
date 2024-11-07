--          ┌─────────────────────────────────────────────────────────┐
--          │                  Lualine Configuration                  │
--          └─────────────────────────────────────────────────────────┘

local dependencies = {
    "nvim-tree/nvim-web-devicons",
}
local config = function()
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

    local function xcodebuild_device()
        if vim.g.xcodebuild_platform == "macOS" then
            return " macOS"
        end

        local deviceIcon = ""
        if vim.g.xcodebuild_platform:match("watch") then
            deviceIcon = "󰖉"
        elseif vim.g.xcodebuild_platform:match("tv") then
            deviceIcon = ""
        elseif vim.g.xcodebuild_platform:match("vision") then
            deviceIcon = "󰊪"
        end

        if vim.g.xcodebuild_os then
            return deviceIcon .. " " .. vim.g.xcodebuild_device_name .. "(" .. vim.g.xcodebuild_os .. ")"
        end

        return deviceIcon .. " " .. vim.g.xcodebuild_device_name
    end

    lualine.setup({
        options = {
            theme = theme,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = { "Oil", "Outline", "Telescope" },
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
            lualine_c = {
                { xcodebuild_device },
                { "'󰙨 ' .. vim.g.xcodebuild_test_plan" },
                { "' ' .. vim.g.xcodebuild_last_status" },
            },
            lualine_x = {},
            lualine_y = {
                { "location", },
                { "mode", },
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

return {
    dependencies = dependencies,
    config = config,
}
