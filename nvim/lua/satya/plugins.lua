return {

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-live-grep-args.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end
	},

	-- rose pine color scheme
	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- 	config = function()
		-- 		vim.cmd("colorscheme rose-pine")
		-- 	end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-treesitter/playground",
	"nvim-tree/nvim-web-devicons",
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 30,
					side = "left",
				},
			})
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { { "nvim-lua/plenary.nvim" } }
	},
	"mbbill/undotree",
	"tpope/vim-fugitive",

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		}
	},
	"folke/zen-mode.nvim",
	"github/copilot.vim",
	"eandrju/cellular-automaton.nvim",
	"laytan/cloak.nvim",
	{
		"fatih/vim-go",
		build = ":GoInstallBinaries",
	},
	"f-person/git-blame.nvim",
	"ojroques/vim-oscyank",
	-- debugging
	"mfussenegger/nvim-dap",
	"nvim-neotest/nvim-nio",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	"nvim-telescope/telescope-dap.nvim",
	"leoluz/nvim-dap-go",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
	"lukas-reineke/indent-blankline.nvim",
	{
		url = "https://codeberg.org/andyg/leap.nvim"
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			-- See Configuration section for options
		},
	},
	{
		"greggh/claude-code.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for git operations
		},
		config = function()
			require("claude-code").setup()
		end
	},
	{
		"marcinjahn/gemini-cli.nvim",
		cmd = "Gemini",
		-- Example key mappings for common actions:
		keys = {
			{ "<leader>a/", "<cmd>Gemini toggle<cr>",   desc = "Toggle Gemini CLI" },
			{ "<leader>aa", "<cmd>Gemini ask<cr>",      desc = "Ask Gemini",       mode = { "n", "v" } },
			{ "<leader>af", "<cmd>Gemini add_file<cr>", desc = "Add File" },

		},
		dependencies = {
			"folke/snacks.nvim",
		},
		config = true,
	},
	{ "windwp/nvim-ts-autotag", config = true },
	{
		"nickjvandyke/opencode.nvim",
		version = "*", -- Latest stable release
		dependencies = {
			{
				-- `snacks.nvim` integration is recommended, but optional
				---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
				"folke/snacks.nvim",
				optional = true,
				opts = {
					input = {}, -- Enhances `ask()`
					picker = { -- Enhances `select()`
						actions = {
							opencode_send = function(...) return require("opencode")
								.snacks_picker_send(...) end,
						},
						win = {
							input = {
								keys = {
									["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
								},
							},
						},
					},
				},
			},
		},
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {
				-- Your configuration, if any; goto definition on the type or field for details
			}

			vim.o.autoread = true -- Required for `opts.events.reload`

			-- Recommended/example keymaps
			vim.keymap.set({ "n", "x" }, "<C-a>",
				function() require("opencode").ask("@this: ", { submit = true }) end,
				{ desc = "Ask opencode…" })
			vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,
				{ desc = "Select opencode…" })
			vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end,
				{ desc = "Toggle opencode" })

			vim.keymap.set({ "n", "x" }, "go", function() return require("opencode").operator("@this ") end,
				{ desc = "Add range to opencode", expr = true })
			vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end,
				{ desc = "Add line to opencode", expr = true })

			vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,
				{ desc = "Scroll opencode up" })
			vim.keymap.set("n", "<S-C-d>",
				function() require("opencode").command("session.half.page.down") end,
				{ desc = "Scroll opencode down" })

			-- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
			vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
			vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
		end,
	},
}
