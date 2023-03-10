-- This file can be loaded by calling `lua require( 'plugins' )` from your init.vim
-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]] --not needed...called L:21

local settings = require( "settings" )
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local function get_config(name)
    return string.format( 'require("config/%s")', name )
end

--Bootstrap Packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
    })
    print("Installing Packer...")
    vim.api.nvim_command("packadd packer.nvim")
end

local packer = require("packer")
packer.init({
    enable = true, --enable profiling via :PackerCompile profile=true
    threshold = 0, --the amount in ms that a plugins load time must be over for it to included in the profile
    max_jobs = 20, --limit the number of simultaneous jobs. nil means no limit. Set to 20 to keep packer sync from getting stuck
    --have packer use pop-up window
    display = {
        open_fn = function ()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use ({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    module = "telescope",
    config = get_config("ui.telescope"),
  })
  use ({ 'crispgm/telescope-heading.nvim' })
  use ({ 'nvim-telescope/telescope-file-browser.nvim' })
  use ({ 'nvim-telescope/telescope-symbols.nvim' })
  use ({ 'nvim-telescope/telescope-packer.nvim' })
  use ({ 'nvim-telescope/telescope-ui-select.nvim' })

  --Useful to help remember what keys are maped
  use ({ "folke/which-key.nvim", get_config = ("ui.which-key") })

  --colorscheme
  use({
	  'bignimbus/pop-punk.vim',
	  as = 'pop-punk',
	  config = function()
		  vim.cmd( 'colorscheme pop-punk' )
	  end
  })

  use ( 'BurntSushi/ripgrep' )
  use ( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use ( 'theprimeagen/harpoon' )
  use ( 'mbbill/undotree' )
  use ( 'tpope/vim-fugitive' )
  use ( 'fatih/vim-go' )
  use ( 'airblade/vim-gitgutter' )
  use ( 'vim-airline/vim-airline' )
  use ( 'vim-airline/vim-airline-themes' )
  use ( 'majutsushi/tagbar' )
  use ( 'ryanoasis/vim-devicons' )
  use ( 'MunifTanjim/nui.nvim' )

  use ({
      'L3MON4D3/LuaSnip',
      requires = "saadparwaiz1/cmp_luasnip",
      config = get_config("coding.luasnip"),
  })

  use ({
    "folke/noice.nvim",
    event = "VimEnter",
    config = get_config("ui.noice"),
    requires = {
        "MunifTanjim/nui.nvim",
        { 'rcarriga/nvim-notify',config = get_config("ui.notify") },
    },
    disable = settings.disable_noice,
  })

  use ({
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      cmd = "Neotree*",
      requires = {
          {
              "s1n7ax/nvim-window-picker",
              config = get_config("ui.nvim-window-picker"),
          },
          "nvim-lua/plenary.nvim",
          "kyazdani42/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
      },
      config = get_config("ui.neotree"),
  })


  use ({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = get_config("coding.todo"),
  })

  use({ "LudoPinelli/comment-box.nvim", cmd = "CB*", config = get_config("coding.comment-box") })


  --LazyGit interface using floaterm
  use ( 'kdheepak/lazygit.nvim', { tag = 'nvim-v0.4.3' })
  --colorscheme
  use ( 'voldikss/vim-floaterm' )

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  { 'neovim/nvim-lspconfig' },
		  { 'williamboman/mason.nvim' },
		  { 'williamboman/mason-lspconfig.nvim' },

		  -- Autocompletion
		  { 'hrsh7th/nvim-cmp' },
		  { 'hrsh7th/cmp-buffer' },
		  { 'hrsh7th/cmp-path' },
		  { 'saadparwaiz1/cmp_luasnip' },
		  { 'hrsh7th/cmp-nvim-lsp' },
		  { 'hrsh7th/cmp-nvim-lua' },

		  -- Snippets
		  { 'L3MON4D3/LuaSnip' },
		  { 'rafamadriz/friendly-snippets' },
	  }
}

end)
