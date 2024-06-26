
--  8888888b.                                   8888888b.  d8b                   
--  888   Y88b                                  888   Y88b Y8P                   
--  888    888                                  888    888                       
--  888   d88P .d88b.  .d8888b   .d88b.         888   d88P 888 88888b.   .d88b.  
--  8888888P" d88""88b 88K      d8P  Y8b        8888888P"  888 888 "88b d8P  Y8b 
--  888 T88b  888  888 "Y8888b. 88888888 888888 888        888 888  888 88888888 
--  888  T88b Y88..88P      X88 Y8b.            888        888 888  888 Y8b.     
--  888   T88b "Y88P"   88888P'  "Y8888         888        888 888  888  "Y8888  

local name = "rose-pine"
local tag = "v2.0.0"
local opts = {

    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
    },

    styles = {
        bold = true,
        italic = true,
        transparency = false,
    },

    groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
    },

    highlight_groups = {
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
        NormalFloat = { bg = "base" },
        FloatBorder = { bg = "base" },
        Float = { bg = "base" },
        WhichKey = { bg = "base" },
        WhichKeyFloat = { bg = "base" },
        TelescopeNormal = { bg = "base" },
        TelescopeBorder = { bg = "base" },
        NoicePopupBorder = { fg = "muted", bg = "base" },
        NoiceCmdlinePopupBorder = { fg = "muted", bg = "base" },
        NoicePopupmenuBorder = { fg = "muted", bg = "base" },
        NoiceConfirmBorder = { fg = "muted", bg = "base" },
        NoiceSplitBorder = { fg = "muted", bg = "base" },
        NoiceCmdlinePopupTitle = { fg = "muted", bg = "base" },
        TelescopeTitle = { fg = "muted", bg = "base" },
        FloatTitle = { fg = "muted", bg = "base" },
    },

    before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
    end,
}

return {
    name = name,
    tag = tag,
    opts = opts,
}
