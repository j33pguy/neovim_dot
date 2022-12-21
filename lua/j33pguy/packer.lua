-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local settings = require("settings")
--local fn = vim.fn

local function get_config(name)
    return string.format('require("config/%s")',name)
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'bignimbus/pop-punk.vim',
	  as = 'pop-punk',
	  config = function()
		  vim.cmd('colorscheme pop-punk')
	  end
  })

  use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate' })
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive' )
  use ('fatih/vim-go')
  use ('airblade/vim-gitgutter')
  use ('vim-airline/vim-airline')
  use ('vim-airline/vim-airline-themes')
  use ('majutsushi/tagbar')
  use ('ryanoasis/vim-devicons')
  use ({
    "folke/noice.nvim",
    event = "VimEnter",
    config = get_config("ui.noice"),
    requires = {
        "MunifTanjim/nui.nvim",
        {'rcarriga/nvim-notify',config = get_config("ui.notify") }
    },
    disable = settings.disable_noice,
  })

  use ('kdheepak/lazygit.nvim', {tag = 'nvim-v0.4.3'})
  use ('voldikss/vim-floaterm')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
}

end)
