require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'html', 'ts_ls', 'inteliphense' },
})


local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}

-- PHP (Intelephense)
lspconfig.intelephense.setup({
    on_attach = function(client, bufnr)
        -- Your on_attach function here
    end,
})

-- JavaScript/TypeScript (tsserver)
lspconfig.ts_ls.setup({
    on_attach = function(client, bufnr)
        -- Your on_attach function here
    end,
})

-- Lua 
lspconfig.lua_ls.setup({
    on_attach = function(client, bufnr)
        -- Your on_attach function here
    end,
})

-- HTML
lspconfig.html.setup({
    on_attach = function(client, bufnr)
        -- Optional: Set up buffer-specific key mappings here
    end,
})
