local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存些文件自动更新安装软件
-- PackerComplie 改成了 PackerSync
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'folke/tokyonight.nvim' -- 主题
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      }
    }
  use("christoomey/vim-tmux-navigator") 
  use("nvim-treesitter/nvim-treesitter") -- 语法高亮
  use("p00f/nvim-ts-rainbow") -- rainbow，不同括号不同颜色

  -- Configurations for Nvim LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  } 

  use {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp"
  }
  -- go
  use("fatih/vim-go")
  use {
   -- 'ray-x/go.nvim',
    'ray-x/guihua.lua',
    'ray-x/lsp_signature.nvim'
  }
  --dap  debug
  use {
    'mfussenegger/nvim-dap',
    'leoluz/nvim-dap-go',
  }

  -- 注释  gcc 单行 gc多行
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  -- 自动补全括号
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- find
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('github/copilot.vim')
  use('skywind3000/asyncrun.vim')

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  -- use('liuchengxu/vista.vim')
  -- use('preservim/tagbar') -- 不好用
  use('simrat39/symbols-outline.nvim')

  -- motion quick move
  -- use('justinmk/vim-sneak') -- s{char}{char} 两个字符快速移动
  -- use('easymotion/vim-easymotion') -- <leader><leader>{char} 快速移动
  use {
    'phaazon/hop.nvim',
    branch = 'v2' -- optional but strongly recommended
  }
  
  -- using packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
