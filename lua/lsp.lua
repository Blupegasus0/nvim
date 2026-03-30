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

-- Rust
-- binary installed with `rustup component add rust-analyzer`
vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {},
  },
})

-- PHP (Intelephense)
vim.lsp.config('intelephense', {})

-- JavaScript/TypeScript
vim.lsp.config('ts_ls', {})

-- Lua
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
            },
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false },
        },
    },
})

-- HTML
vim.lsp.config('html', {})

-- CSS
vim.lsp.config('cssls', {})

vim.lsp.enable({ 'rust_analyzer', 'intelephense', 'ts_ls', 'lua_ls', 'html', 'cssls' })
