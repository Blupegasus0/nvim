-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

-- Keybindings 
local function set_keymap(mode, keys, command, opts)
  opts = opts or { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, keys, command, opts)
end

-- Toggle NvimTree
set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>')  -- Open or close the tree

-- Focus NvimTree
set_keymap('n', '<leader>e', ':NvimTreeFocus<CR>')   -- Open the tree if closed and focus on it

-- Find file in NvimTree
set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>') -- Move cursor in the tree for the current buffer

-- Collapse NvimTree
set_keymap('n', '<leader>c', ':NvimTreeCollapse<CR>') -- Collapse the nvim-tree recursively
