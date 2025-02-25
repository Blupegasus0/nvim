-- Minimal config
vim.api.nvim_set_keymap('n', '<leader>tt', ':Themery<CR>', { noremap = true, silent = true })

require("themery").setup({
  themes = { "gruvbox", "monoglow", "monokai" }, -- Your list of installed colorschemes.
  livePreview = true, -- Apply theme while picking. Default to true.
})
