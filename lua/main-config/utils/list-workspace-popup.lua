
--  888     888 888    d8b 888          
--  888     888 888    Y8P 888          
--  888     888 888        888          
--  888     888 888888 888 888 .d8888b  
--  888     888 888    888 888 88K      
--  888     888 888    888 888 "Y8888b. 
--  Y88b. .d88P Y88b.  888 888      X88 
--   "Y88888P"   "Y888 888 888  88888P'

local nui_popup = require("nui.popup")
local event = require("nui.utils.autocmd").event
local workspace_list_popup = nui_popup({
    enter = true,
    focusable = false,
    border = {
        style = "single",
    },
    position = "50%",
    size = {
        width = "80%",
        height = "60%",
    },
    buf_options = {
        modifiable = true,
        readonly = false,
    },
})

return {
    open_popup = function()

        workspace_list_popup:mount()
        workspace_list_popup:on(event.BufLeave, function()
            workspace_list_popup:unmount()
        end)

        vim.api.nvim_buf_set_lines(workspace_list_popup.bufnr, 0, 1, false, vim.lsp.buf.list_workspace_folders())
    end
}

