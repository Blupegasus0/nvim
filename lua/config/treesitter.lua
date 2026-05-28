local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = {
        "rust", "lua", "php", "typescript", "javascript",
        "html", "css",
        "python",
        "markdown", "markdown_inline",
        "yaml",
        "json",
        "bash",
        "query",
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
})

