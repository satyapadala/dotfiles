vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} },

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
		{run = ':TSUpdate'}
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
			{'williamboman/mason.nvim'},
		        {'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	},
	use("folke/zen-mode.nvim"),
	use("github/copilot.vim"),
	use("eandrju/cellular-automaton.nvim"),
	use("laytan/cloak.nvim"),
	use(
                  'fatih/vim-go',
                  { run = ':GoInstallBinaries' }),
}
end
)
