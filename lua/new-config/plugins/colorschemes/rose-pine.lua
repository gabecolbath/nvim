--          ┌─────────────────────────────────────────────────────────┐
--          │                 Rose-Pine Configuration                 │
--          └─────────────────────────────────────────────────────────┘

local name = "rose-pine"
local opts = {
	variant = "auto", -- options: auto, main, moon, or dawn
	dark_variant = "main", -- options: main, moon, dawn
	dim_inactive_windows = false,
	enable = {
		terminal = true,
		legacy_highlights = false,
		migrations = false,
	},
	styles = {
		bold = true,
		italic = true,
		transparency = true,
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
	palette = {
		-- For overrides
	},
	highlight_groups = {
        -- Zenmode
        ZenBg = { bg = "" },
	},
}

return {
	name = name,
	opts = opts,
}
