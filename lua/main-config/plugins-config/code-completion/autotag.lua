
--         d8888          888            888                      
--        d88888          888            888                      
--       d88P888          888            888                      
--      d88P 888 888  888 888888 .d88b.  888888  8888b.   .d88b.  
--     d88P  888 888  888 888   d88""88b 888        "88b d88P"88b 
--    d88P   888 888  888 888   888  888 888    .d888888 888  888 
--   d8888888888 Y88b 888 Y88b. Y88..88P Y88b.  888  888 Y88b 888 
--  d88P     888  "Y88888  "Y888 "Y88P"   "Y888 "Y888888  "Y88888 
--                                                            888 
--                                                       Y8b d88P 
--                                                        "Y88P" 

local opts = {
    filetypes = {
        'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
        'xml',
        'php',
        'markdown',
        'astro', 'glimmer', 'handlebars', 'hbs'
    }
    skip_tags = {
        'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
        'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem',
    }
}

return {
    opts = opts,
}
