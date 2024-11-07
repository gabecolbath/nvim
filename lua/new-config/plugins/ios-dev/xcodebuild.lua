--          ┌─────────────────────────────────────────────────────────┐
--          │                XCode Build Configuration                │
--          └─────────────────────────────────────────────────────────┘

local dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
}
local config = function()
    local xcode_build = require("xcodebuild")
    xcode_build.setup()
end

return {
    dependencies = dependencies,
    config = config,
}
