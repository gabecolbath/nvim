
return {
    "bassamsdata/namu.nvim",
    config = function()
        require("namu").setup({
            namu_symbols = {
                options = {
                    AllowKinds = {
                        default = {
                            "Function",
                            "Method",
                            "Class",
                            "Module",
                            "Property",
                            "Variable",
                            "Constant",
                            "Enum",
                            "Interface",
                            "Field",
                            "Struct",
                        }
                    },
                    row_position = "top10_right",
                    window = {
                        border = "single",
                    },
                    display = {
                        format = "tree_guides",
                    },
                }
            }
        })
    end
}
