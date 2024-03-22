
--         d8888 888          888               
--        d88888 888          888               
--       d88P888 888          888               
--      d88P 888 888 88888b.  88888b.   8888b.  
--     d88P  888 888 888 "88b 888 "88b     "88b 
--    d88P   888 888 888  888 888  888 .d888888 
--   d8888888888 888 888 d88P 888  888 888  888 
--  d88P     888 888 88888P"  888  888 "Y888888 
--                   888                        
--                   888                        
--                   888                        

local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
}

local config = function()
    local alpha = require("alpha")
    local theta_theme = require("alpha.themes.theta")
    alpha.setup(theta_theme.config)
end

return {
    dependencies = dependencies,
    config = config,
}
