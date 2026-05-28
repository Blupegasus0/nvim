-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-------------------
-- Terminal mode --
-------------------

-- Send ^W (word-delete) to the shell; neovim intercepts <C-w> in terminal mode by default
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.keymap.set('t', '<C-w>', function()
      local chan = vim.b.terminal_job_id
      if chan then vim.api.nvim_chan_send(chan, '\023') end
    end, { noremap = true, buffer = true })
  end,
})

-----------------
---   LSP     ---
-----------------

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local o = { noremap = true, silent = true, buffer = ev.buf }
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,             vim.tbl_extend('force', o, { desc = 'LSP rename' }))
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,        vim.tbl_extend('force', o, { desc = 'LSP code action' }))
        vim.keymap.set('n', '<leader>d',  vim.diagnostic.open_float,      vim.tbl_extend('force', o, { desc = 'Diagnostic float' }))
        vim.keymap.set('n', '<leader>q',  vim.diagnostic.setloclist,      vim.tbl_extend('force', o, { desc = 'Diagnostic list' }))
        vim.keymap.set('n', 'gs',         vim.lsp.buf.signature_help,     vim.tbl_extend('force', o, { desc = 'Signature help' }))
    end,
})

-- Diagnostic display: show source, limit width, virtual text on current line only
vim.diagnostic.config({
    virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN },
        source = 'if_many',
        prefix = '●',
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = true,
        header = '',
        prefix = '',
    },
})

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

