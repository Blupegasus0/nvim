-- options.lua

-- Line Numbers
vim.opt.number = true                -- Show line numbers
vim.opt.relativenumber = true        -- Show relative line numbers

-- Tabs and Indentation
vim.opt.tabstop = 4                  -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4               -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true              -- Use spaces instead of tabs

-- Search Settings
vim.opt.ignorecase = true            -- Ignore case when searching
vim.opt.smartcase = true             -- Override ignorecase if search contains uppercase letters
vim.opt.incsearch = true             -- Show search matches as you type
vim.opt.hlsearch = true              -- Highlight all matches of the search

-- Display Options
vim.opt.showcmd = true               -- Show command in the bottom bar
vim.opt.cursorline = true            -- Highlight the current line
vim.opt.wrap = false                   -- Wrap long lines
vim.opt.linebreak = true              -- Don't wrap words

-- File Encoding
vim.opt.encoding = "utf-8"           -- Set the file encoding to UTF-8
vim.opt.fileencodings = { "utf-8", "latin1" } -- List of encodings to try when opening files

-- Backup and Undo
vim.opt.backup = true                 -- Enable backup files
vim.opt.backupdir = "/tmp/nvim/backups//"  -- Store backup files in a specific directory
vim.opt.undofile = true               -- Enable persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Set the directory for undo files

-- Mouse Support
vim.opt.mouse = "a"                  -- Enable mouse support in all modes

-- Color Scheme
vim.opt.syntax = "on"                -- Enable syntax highlighting
vim.opt.background = "light"          -- Set background color (dark or light)
vim.cmd("colorscheme desert")        -- Set a color scheme 

-- Additional Options
vim.opt.splitbelow = true             -- Split windows below
vim.opt.splitright = true             -- Split windows to the right
vim.opt.termguicolors = true          -- Enable 24-bit RGB colors

-- Set the clipboard to use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable folding
vim.opt.foldmethod = "indent"         -- Fold based on indentation
vim.opt.foldlevel = 99                 -- Open all folds by default

-- Set the leader key
vim.g.mapleader = " "                  -- Set leader key to space

-- Additional settings can be added here

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8
