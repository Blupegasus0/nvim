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
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'html', 'cssls', 'ts_ls', 'intelephense' },
})

local lspconfig = require('lspconfig')
local null_ls = require('null-ls')

local on_attach = function(client, bufnr)
    -- Key mapping for formatting
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>p', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
end

-- Setup null-ls for Prettier
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
    },
    on_attach = on_attach, -- Ensure on_attach is called
})

-- Rust
-- binary installed with `rustup component add rust-analyzer`
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

-- CSS
lspconfig.cssls.setup({
    on_attach = function(client, bufnr)
        -- Optional: Set up buffer-specific key mappings here
    end,
})
