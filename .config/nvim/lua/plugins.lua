-- plugins.lua

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.im]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'folke/which-key.nvim',
    config = function()
      require('config.whichkey')
    end
  }
  use 'nvim-tree/nvim-web-devicons'
  use {
    'ellisonleao/gruvbox.nvim',
    config = function()
      require('config.gruvbox')
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('config.lualine')
    end
  }
  use {
    'kylechui/nvim-surround',
    tag = '*',
    config = function()
      require('config.surround')
    end
  }
  use 'tpope/vim-vinegar'
  use 'sheerun/vim-polyglot'
  use {
    'sitiom/nvim-numbertoggle',
    config = function()
      require('config.numbertoggle')
    end
  }
  --[[ use {
	'gelguy/wilder.nvim',
	requires ={ 'romgrk/fzy-lua-native', 'nixprime/cpsm' },
	config = function() 
		require('config.wilder')
	end
  } ]]
  use {
	  'ahmedkhalf/project.nvim',
	  config = function()
		  require('config.project')
	  end
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('config.telescope')
    end
  }
  use {
      'numToStr/Comment.nvim',
      config = function()
	      require('config.comment')
      end
  }
  use 'neovim/nvim-lspconfig'
  use {
	  'ms-jpq/coq_nvim',
	  branch = 'coq',
	  config = function()
		  require('config.coq')
	  end
  }
  use {
	  'ms-jpq/coq.artifacts',
	  branch = 'artifacts'
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

  -- reload plugin config on change
  vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
  ]])
end)
