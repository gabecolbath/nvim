
--  888b     d888          d8b                  .d8888b.                     .d888 d8b          
--  8888b   d8888          Y8P                 d88P  Y88b                   d88P"  Y8P          
--  88888b.d88888                              888    888                   888                 
--  888Y88888P888  8888b.  888 88888b.         888         .d88b.  88888b.  888888 888  .d88b.  
--  888 Y888P 888     "88b 888 888 "88b        888        d88""88b 888 "88b 888    888 d88P"88b 
--  888  Y8P  888 .d888888 888 888  888 888888 888    888 888  888 888  888 888    888 888  888 
--  888   "   888 888  888 888 888  888        Y88b  d88P Y88..88P 888  888 888    888 Y88b 888 
--  888       888 "Y888888 888 888  888         "Y8888P"   "Y88P"  888  888 888    888  "Y88888 
--                                                                                          888 
--                                                                                     Y8b d88P 
--                                                                                      "Y88P"  

require("main-config.opts")
require("main-config.lazy.bootstrap")

local lazy = require("lazy")
local plugins = require("main-config.lazy.plugins")
local opts = require("main-config.lazy.opts")

-- Lazy --
lazy.setup(plugins, opts)

-- Colorscheme --
require("main-config.colorscheme")

-- LSP -- 
require("main-config.lsp")
