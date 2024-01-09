vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- telescope
	use {
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-telescope/telescope-live-grep-args.nvim" },
				{ "nvim-lua/plenary.nvim" },
			},
			config = function()
				require("telescope").load_extension("live_grep_args")
			end
		}),

		-- rose pine color scheme
		use({
			'rose-pine/neovim',
			as = 'rose-pine',
			config = function()
				vim.cmd('colorscheme rose-pine')
			end
		}),
		use(
			'nvim-treesitter/nvim-treesitter',
			{ run = ':TSUpdate' }
		),
		use('nvim-treesitter/playground'),
		use('theprimeagen/harpoon'),
		use('mbbill/undotree'),
		use('tpope/vim-fugitive'),

		use {
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v3.x',
			requires = {
				--- Uncomment these if you want to manage LSP servers from neovim
				{ 'williamboman/mason.nvim' },
				{ 'williamboman/mason-lspconfig.nvim' },

				-- LSP Support
				{ 'neovim/nvim-lspconfig' },
				-- Autocompletion
				{ 'hrsh7th/nvim-cmp' },
				{ 'hrsh7th/cmp-nvim-lsp' },
				{ 'L3MON4D3/LuaSnip' },
			}
		},
		use("folke/zen-mode.nvim"),
		use("github/copilot.vim"),
		use("eandrju/cellular-automaton.nvim"),
		use("laytan/cloak.nvim"),
		use("mfussenegger/nvim-jdtls"),
		-- Obsidian
		use({
			"epwalsh/obsidian.nvim",
			tag = "*", -- recommended, use latest release instead of latest commit
			requires = {
				-- Required.
				"nvim-lua/plenary.nvim",

				-- see below for full list of optional dependencies 👇
			},
			config = function()
				require("obsidian").setup({
					workspaces = {
						{
							name = "personal",
							path =
							"/Users/satyap/iCloud Drive (Archive)/Documents/Uber/Obsidian/MyPersonalVault",
						},
					},

					-- see below for full list of options 👇
				})
			end,
		}),
		use("ojroques/vim-oscyank"),
	}
end
)
