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
	use 'wbthomason/packer.nvim'
	use 'windwp/nvim-autopairs'
	use 'akinsho/toggleterm.nvim'

	use {
		'iamcco/markdown-preview.nvim',
		run = 'cd app && npm install',
		ft = 'markdown'
	}

	use {
		'akinsho/bufferline.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons'
		}
	}
	use 'moll/vim-bbye'

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',
		}
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		}
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'

	-- cmp
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'

	-- Automatically setup configuration after inital install
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)
