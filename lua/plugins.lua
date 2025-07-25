-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- LSP manager
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",

		-- Color Schemes
		{ "wnkz/monoglow.nvim", lazy = false, priority = 1000, opts = {} },
		{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = {} },
		{ "tanvirtin/monokai.nvim", },

		-- Vscode-like pictograms
		{
			"onsails/lspkind.nvim",
			event = { "VimEnter" },
		},
		-- Auto-completion engine
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"lspkind.nvim",
				"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
				"hrsh7th/cmp-buffer", -- buffer auto-completion
				"hrsh7th/cmp-path", -- path auto-completion
				"hrsh7th/cmp-cmdline", -- cmdline auto-completion
			},
			config = function()
				require("config.nvim-cmp")
			end,
		},
		-- Code snippet engine
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
		},

		-- Fuzzy finder (file search)
		{
			'nvim-telescope/telescope.nvim', tag = '0.1.8',
			dependencies = { 'nvim-lua/plenary.nvim' },
			config = function()
				require("config.telescope")
			end,
		},

		-- File Explorer
		{
			"nvim-tree/nvim-tree.lua",
			version = "*",
			lazy = false,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("config.nvim-tree")
			end,
		},

		-- Terminal
		{
			"Dan7h3x/neaterm.nvim",
			branch = "stable",
			event = "VeryLazy",
			opts = require("config.neaterm"),
			dependencies = {
				"nvim-lua/plenary.nvim",
				"ibhagwan/fzf-lua",
			},
		},

		{
			"nvim-treesitter/nvim-treesitter", 
			build = ":TSUpdate",
			config = function () 
				require("config.treesitter")
			end
		},

		-- Status line
		{
			"NTBBloodbath/galaxyline.nvim",
			-- your statusline
			config = function()
				require("galaxyline.themes.eviline")
			end,
			-- some optional icons
			dependencies = { "kyazdani42/nvim-web-devicons", opt = true }
		},

		-- Tabs
		{
			'romgrk/barbar.nvim',
			dependencies = {
				'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
				'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
			},
			init = function() 
				vim.g.barbar_auto_setup = false 
				require("config.barbar")
			end,
			opts = {
				-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
				-- animation = true,
				-- insert_at_start = true,
				-- …etc.
			},
			version = '^1.0.0', -- optional: only update when a new 1.x version is released
		},

		-- Git
		{
			'lewis6991/gitsigns.nvim',
			version = "*",
			lazy = false,
			dependencies = {
				'nvim-lua/plenary.nvim',
			},
			config = function()
				require('gitsigns').setup {
					-- Other configuration options can go here
				}
			end,
		},

		-- Indentation guides
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			---@module "ibl"
			---@type ibl.config
			opts = {},
		},

		-- Auto pair (brackets and such)
		{
			'windwp/nvim-autopairs',
			event = "InsertEnter",
			config = true
			-- use opts = {} for passing setup options
			-- this is equivalent to setup({}) function
		},

        -- Theme switcher
        {
            "zaldih/themery.nvim",
            lazy = false,
            config = function()
                require("config.themery")
            end
        },

        -- Nice VSCode-like comments
        {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        },

        ----------------------
        -- Language Support --
        ----------------------
        { 'rust-lang/rust.vim' },
        {
            'mrcjkb/rustaceanvim',
            version = '^5', -- Recommended
            lazy = false, -- This plugin is already lazy
        },
        {
            'nvim-flutter/flutter-tools.nvim',
            lazy = false,
            dependencies = {
                'nvim-lua/plenary.nvim',
                'stevearc/dressing.nvim', -- optional for vim.ui.select
            },
            config = true,
        },
        { 'saadparwaiz1/cmp_luasnip' },

        -- Add null-ls for formatting
        {
            "jose-elias-alvarez/null-ls.nvim",
            dependencies = { "mason.nvim" }, -- Ensure it depends on mason
            config = function()
                local null_ls = require("null-ls")
                null_ls.setup({
                    sources = {
                        null_ls.builtins.formatting.prettier,
                    },
                })
            end,
        },


    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

-- Key mapping for prettier formatting
vim.api.nvim_set_keymap('n', '<leader>p', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
