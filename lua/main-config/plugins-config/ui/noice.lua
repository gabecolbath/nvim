
--  888b    888          d8b                  
--  8888b   888          Y8P                  
--  88888b  888                               
--  888Y88b 888  .d88b.  888  .d8888b .d88b.  
--  888 Y88b888 d88""88b 888 d88P"   d8P  Y8b 
--  888  Y88888 888  888 888 888     88888888 
--  888   Y8888 Y88..88P 888 Y88b.   Y8b.     
--  888    Y888  "Y88P"  888  "Y8888P "Y8888  

local event = "VeryLazy"

local dependencies = {
    "MunifTanjim/nui.nvim",
}

local opts = {
    lsp = {
        signature = {
            enabled = false,
        },
    },
    views = {
        cmdline_popup = {
            position = {
                row = "0%",
                col = "100%",
            },
            border = {
                style = "single",
                padding = { 0, 0 },
            },
        },
        popup = {
            border = {
                style = "single",
            },
        },
        mini = {
            border = {
                style = "single",
            },
            position = {
                row = -2,
                col = "100%",
            },
        },
    },
}

return {
    event = event,
    dependencies = dependencies,
    opts = opts,
}
