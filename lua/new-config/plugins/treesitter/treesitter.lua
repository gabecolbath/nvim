local opts = {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

return {
    opts = opts,
}
