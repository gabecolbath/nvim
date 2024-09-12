
--  8888888b.  888                   d8b                   
--  888   Y88b 888                   Y8P                   
--  888    888 888                                         
--  888   d88P 888 888  888  .d88b.  888 88888b.  .d8888b  
--  8888888P"  888 888  888 d88P"88b 888 888 "88b 88K      
--  888        888 888  888 888  888 888 888  888 "Y8888b. 
--  888        888 Y88b 888 Y88b 888 888 888  888      X88 
--  888        888  "Y88888  "Y88888 888 888  888  88888P' 
--                               888                       
--                          Y8b d88P                       
--                           "Y88P"                        

local default_path = "main-config.plugins-config"

local build_configuration = function(git_path, plugin, config_path)
    if config_path == nil then
        return git_path
    end
    local status, specs = pcall(require, config_path .. "." .. plugin)
    if not status then
        print("Failed to load plugin specs for " .. plugin)
        return git_path
    end
    local configuration = { git_path }
    for name, spec in pairs(specs) do
        configuration[name] = spec
    end
    return configuration
end

local config_dir = function(directory_name)
    if directory_name == nil then
        return default_path
    end
    return default_path .. "." .. directory_name
end

-- Colorschemes ---------------------------------------------------------------
local rose_pine = build_configuration("rose-pine/nvim", "rose-pine", config_dir("colorschemes"))
local colorschemes = { rose_pine }

-- LSP ------------------------------------------------------------------------
local lsp_kind = build_configuration("onsails/lspkind.nvim", "lspkind", config_dir("lsp"))
local mason = build_configuration("williamboman/mason.nvim", "mason", config_dir("lsp"))
local mason_lspconfig = build_configuration("williamboman/mason-lspconfig.nvim", "mason-lspconfig", config_dir("lsp"))
local lsp_config = build_configuration("neovim/nvim-lspconfig", "lspconfig", config_dir("lsp"))
local lsp = { lsp_kind, mason, mason_lspconfig, lsp_config }

-- Key Binding ----------------------------------------------------------------
local which_key = build_configuration("folke/which-key.nvim", "which-key", config_dir("key-binding"))
local key_binding = { which_key }

-- File Tree ------------------------------------------------------------------
local oil = build_configuration("stevearc/oil.nvim", "oil", config_dir("file-tree"))
local file_tree = { oil }

-- Code Completion ------------------------------------------------------------
local cmp = build_configuration("hrsh7th/nvim-cmp", "cmp", config_dir("code-completion"))
local cmp_signature_help = build_configuration("hrsh7th/cmp-nvim-lsp-signature-help", "cmp-signature-help");
local cmp_lsp = build_configuration("hrsh7th/cmp-nvim-lsp", "cmp-lsp")
local cmp_buffer = build_configuration("hrsh7th/cmp-buffer", "cmp-buffer")
local cmp_path = build_configuration("hrsh7th/cmp-path", "cmp-path")
local cmp_cmdline = build_configuration("hrsh7th/cmp-cmdline", "cmp-cmdline")
local luasnip = build_configuration("L3MON4D3/LuaSnip", "luasnip", config_dir("code-completion"))
local autopairs = build_configuration("windwp/nvim-autopairs", "autopairs", config_dir("code-completion"))
-- local autotag = build_configuration("windwp/nvim-ts-autotag", "autotag", config_dir("code-completion"))
local code_completion = { cmp, cmp_signature_help, cmp_lsp, cmp_buffer, cmp_path, cmp_cmdline, luasnip, autopairs, --[[autotag--]] }

-- Syntax Highlighting --------------------------------------------------------
local treesitter = build_configuration("nvim-treesitter/nvim-treesitter", "treesitter", config_dir("syntax-highlighting"))
local treesitter_context = build_configuration("nvim-treesitter/nvim-treesitter-context", "treesitter-context", config_dir("syntax-highlighting"))
local syntax_highlighting = { treesitter, treesitter_context }

-- Fuzzy Finder ---------------------------------------------------------------
local telescope = build_configuration("nvim-telescope/telescope.nvim", "telescope", config_dir("fuzzy-finder"))
local fuzzy_finder = { telescope }

-- Navigation -----------------------------------------------------------------
local harpoon = build_configuration("ThePrimeagen/harpoon", "harpoon", config_dir("navigation"))
local vim_tmux_navigator = build_configuration("christoomey/vim-tmux-navigator", "vim-tmux-navigator", config_dir("navigation"))
local navigation = { harpoon, vim_tmux_navigator }

-- Utilities ------------------------------------------------------------------
local code_action = build_configuration("weilbith/nvim-code-action-menu", "code-action", config_dir("utilities"))
local comment = build_configuration("numToStr/comment.nvim", "comment", config_dir("utilities"))
local compiler_explorer = build_configuration("krady21/compiler-explorer.nvim", "compiler-explorer")
local spectre = build_configuration("nvim-pack/nvim-spectre", "spectre", config_dir("utilities"))
local surround = build_configuration("kylechui/nvim-surround", "surround", config_dir("utilities"))
local trouble = build_configuration("folke/trouble.nvim", "trouble", config_dir("utilities"))
local undotree = build_configuration("mbbill/undotree", "undotree", config_dir("utilities"))
local utilities = { code_action, comment, compiler_explorer, spectre, surround, trouble, undotree }

-- UI -------------------------------------------------------------------------
local alpha = build_configuration("goolord/alpha-nvim", "alpha", config_dir("ui"))
local dressing = build_configuration("stevearc/dressing.nvim", "dressing", config_dir("ui"))
local lualine = build_configuration("nvim-lualine/lualine.nvim", "lualine", config_dir("ui"))
local zenmode = build_configuration("folke/zen-mode.nvim", "zenmode", config_dir("ui"))
local noice = build_configuration("folke/noice.nvim", "noice", config_dir("ui"))
local ui = { alpha, dressing, lualine, zenmode, noice }

-- Git ------------------------------------------------------------------------
local gitsigns = build_configuration("lewis6991/gitsigns.nvim", "gitsigns", config_dir("git"))
local vim_fugitive = build_configuration("tpope/vim-fugitive", "vim-fugitive")
local git = { gitsigns, vim_fugitive }

return {
    colorschemes,
    lsp,
    key_binding,
    file_tree,
    code_completion,
    syntax_highlighting,
    fuzzy_finder,
    navigation,
    utilities,
    ui,
    git,
}
