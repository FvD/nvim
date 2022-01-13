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
  use 'kdheepak/JuliaFormatter.vim'
  use 'jpalardy/vim-slime'
 
  -- Colorschemes
  use 'joshdick/onedark.vim'
  use 'EdenEast/nightfox.nvim'
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  } 

  -- Golang
  use {'fatih/vim-go', run = ':GoUpdateBinaries' }
  
  -- R
  use 'jalvesaq/NVim-R'
  --
  -- javascript
  use { 'HerringtonDarkholme/yats.vim', ft = 'typescript' }
  use { 'posva/vim-vue' } -- Vue highlighting
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
 
   -- general dev
   use 'neovim/nvim-lspconfig'
   use 'kabouzeid/nvim-lspinstall'
--   use 'glepnir/lspsaga.nvim' -- this is the upstream rep
   use 'tami5/lspsaga.nvim' -- this is temporary because the upstream repo has a bug
   use 'hrsh7th/nvim-compe'
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

  require'lspsaga'.init_lsp_saga {
    error_sign = '!',
    warn_sign = '^',
    hint_sign = '?',
    infor_sign = '~',
    border_style = "round",
    code_action_prompt = {
      enable = false
    }
  }

  -- search
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
