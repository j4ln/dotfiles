-- Automatically install packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	print('Installed packer, close and reopen Neovim...')
end

-- Return if packer isn't installed
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Sync plugins on file save
local group = vim.api.nvim_create_augroup("packer_user_config", { clear = true})
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerSync",
	pattern = "plugins.lua",
	group = group,
})

-- Packer floating window
packer.init {
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'single' })
		end
	}
}

-- Use packer
return packer.startup(function(use)
	-- General
	use 'wbthomason/packer.nvim'	-- Packer itself
	use 'windwp/nvim-autopairs'		-- Autopairs
	use 'akinsho/toggleterm.nvim'	-- Toggle terminal

	-- Markdown preview
	use {
		'iamcco/markdown-preview.nvim',
		run = 'cd app && npm install',
		ft = 'markdown'
	}

	-- Buffers
	use {
		'akinsho/bufferline.nvim',	-- Bufferline
		requires = {
			'kyazdani42/nvim-web-devicons'
		}
	}
	use 'moll/vim-bbye'				-- Buffer bye

	-- Nvimtree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',
		}
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		}
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- LSP
	use 'neovim/nvim-lspconfig'		-- LSP config
	use 'williamboman/nvim-lsp-installer' -- Language server installer

	-- cmp
	use 'hrsh7th/nvim-cmp'			-- Auto complete
	use 'hrsh7th/cmp-buffer'		-- Buffer completion
	use 'hrsh7th/cmp-path'			-- Path completion
	use 'hrsh7th/cmp-cmdline'		-- Command completion
	use 'hrsh7th/cmp-nvim-lsp'		-- LSP completion
	use 'L3MON4D3/LuaSnip'			-- Snippet engine

	-- Automatically setup configuration after inital install
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)
