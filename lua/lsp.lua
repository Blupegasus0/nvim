-- Ensure bun is in PATH (commonly installed to ~/.bun/bin but not in SSH PATH)
local bun_bin = vim.fn.expand('~/.bun/bin')
if vim.fn.isdirectory(bun_bin) == 1 and not vim.env.PATH:find(bun_bin, 1, true) then
    vim.env.PATH = bun_bin .. ':' .. vim.env.PATH
end
-- When bun is available, use the npm→bun shim in nvim config bin/
if vim.fn.executable('bun') == 1 then
    vim.env.PATH = vim.fn.stdpath('config') .. '/bin:' .. vim.env.PATH
end

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
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'html', 'cssls', 'ts_ls', 'intelephense', 'pyright', 'marksman', 'yamlls' },
})

-- Rust
-- binary installed with `rustup component add rust-analyzer`
vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {},
  },
})

-- PHP
vim.lsp.config('intelephense', {
    filetypes = { 'php' },
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        local root = vim.fs.root(bufnr, { 'composer.json', '.git', '.svn' })
            or vim.fn.fnamemodify(fname, ':h')
        on_dir(root)
    end,
})

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

-- Python
vim.lsp.config('pyright', {})

-- Markdown (binary install, no npm)
vim.lsp.config('marksman', {})

-- YAML
local ok_store, schemastore = pcall(require, 'schemastore')
vim.lsp.config('yamlls', {
    settings = {
        yaml = {
            schemas = ok_store and schemastore.yaml.schemas() or {},
            validate = true,
        },
    },
})

-- HTML
vim.lsp.config('html', {})

-- CSS
vim.lsp.config('cssls', {})

vim.lsp.enable({ 'rust_analyzer', 'intelephense', 'pyright', 'ts_ls', 'lua_ls', 'html', 'cssls', 'marksman', 'yamlls' })
