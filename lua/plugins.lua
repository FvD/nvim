-- Bootstrap packer if not available
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
 
  -- Julia
  use 'JuliaEditorSupport/julia-vim'
  use 'jpalardy/vim-slime'
 
  -- Colorschemes
  use 'EdenEast/nightfox.nvim'
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  } 

  -- Golang
  use {'fatih/vim-go', run = ':GoUpdateBinaries' }
  
  -- R
  use 'jalvesaq/NVim-R'

  -- javascript
  use { 'HerringtonDarkholme/yats.vim', ft = 'typescript' }
  use 'othree/javascript-libraries-syntax.vim'

  -- python
  use { 'Vimjas/vim-python-pep8-indent', ft = 'python' }
  
  -- Other
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-vinegar'
  use 'justinmk/vim-dirvish'
  use 'justinmk/vim-sneak'
  
  -- utilities
  use 'junegunn/vim-easy-align'
 
  use 'Valloric/MatchTagAlways'
  use 'vim-scripts/ShowMarks'
  use 'vim-scripts/Unicode-RST-tables'
 
  use {'euclio/vim-markdown-composer', run = 'cargo build --release --locked' }
 
   -- Autocompletion
   use 'hrsh7th/cmp-nvim-lua'
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'hrsh7th/cmp-cmdline'
   use 'hrsh7th/nvim-cmp'

   use({"L3MON4D3/LuaSnip", tag = "v1.*"})

   -- general dev
   use 'neovim/nvim-lspconfig'
   use 'kabouzeid/nvim-lspinstall'
   use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
 
   require'nvim-treesitter.configs'.setup {
     highlight = {
       enable = true,
       disable = { "ruby" }
     }
   }
 
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      }
  )

  -- lspsaga
  use 'glepnir/lspsaga.nvim'

  local saga = require('lspsaga')
  saga.init_lsp_saga()

  -- neorg
  use {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers", -- This is the important bit!
    config = function()
        require('neorg').setup {
           load = {
               -- This module deals with handling everything related to the :Neorg command.
               ["core.neorgcmd"] = {}, 
               -- "Hop" between Neorg links, following them with a single keypress.
               ["core.norg.esupports.hop"] = {}, 
               -- A set of instructions for Neovim to indent Neorg documents. 
               ["core.norg.esupports.indent"] = {},
               -- A Neorg module for generating document metadata automatically.
               ["core.norg.esupports.metagen"] = {}, 
               -- Easily create files for a journal.
               -- ["core.norg.journal"] = {}, 
               -- Handles the displaying of Neorg news and other forms of media in a popup.
               ["core.norg.news"] = {}, 
               -- Generates a Table of Content from the Neorg file.
               ["core.norg.qol.toc"] = {}, 
               -- Module for implementing todo lists.
               ["core.norg.qol.todo_items"] = {}, 
               -- Handles interaction for syntax files for code blocks.
               ["core.syntax"] = {}, 
               -- A module designed to integrate TreeSitter into Neorg.
               ["core.integrations.treesitter"] = {}, 
               -- Module for managing keybindings with Neorg mode support.
               ["core.keybinds"] = {}, 
               -- Handles the creation and management of Neovim's autocommands.
               ["core.autocommands"] = {}, 
               -- An Advanced Code Block Exporter.
               ["core.tangle"] = {}, 
               -- Modes are a way of isolating different parts of Neorg based on the current mode.
               ["core.mode"] = {}, 
               -- This module is be responsible for managing directories full of .norg files.
               ["core.norg.dirman"] = {
                    config = {
                        workspaces = {
                            fvd = "~/Documents/neorg_workspace",
                        },
                        autochdir = true, -- Automatically change the directory to the current workspace's root every time
                        index = "index.norg", -- The name of the main (root) .norg file
                        default_workspace = "fvd",
                   },
               },
               -- Manages your tasks with Neorg using the Getting Things Done methodology.
               ["core.gtd.base"] = {
	                  config = { 
			                  workspace = "fvd",
		                 },
	            }, 
               -- Exports Neorg documents into any other supported filetype.
               ["core.export"] = {}, 
               -- A Neorg module for moving around different elements up and down.
               ["core.norg.manoeuvre"] = {}, 
               -- Interface for core.export to allow exporting to markdown.
               ["core.export.markdown"] = {}, 
               -- Enhances the basic Neorg experience by using icons instead of text.
               ["core.norg.concealer"] = {}, 
               -- A wrapper to interface with several different completion engines.
               ["core.norg.completion"] = {
                    config = {
                       engine = "nvim-cmp",
                  }, 
                },
               -- Neorg module to create gorgeous presentation slides.
               --["core.presenter"] = {}, 
       }
    }
    end,
    requires = "nvim-lua/plenary.nvim",
}

  -- search
  use { 'nvim-telescope/telescope.nvim', 
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)



