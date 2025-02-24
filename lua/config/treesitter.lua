local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "rust", "lua", "php", "typescript", "query", "css", "javascript", "html" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },  
    autotag = { enable = true },
})

