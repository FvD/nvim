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
 
 -- Markdown Preview (install without yarn or npm)
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

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
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require('lspsaga').setup({})
    end,
  })


  -- search
  use { 
   'nvim-telescope/telescope.nvim', 
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }


-- Telekasten
  use {
    'renerocksai/telekasten.nvim',
    requires = {'nvim-telescope/telescope.nvim'}
  }

  local tk_home = "/home/frans/Documents/zettelkasten"
 
  require('telekasten').setup({
      home = tk_home,
    
    -- if true, telekasten will be enabled when opening a note within the configured home
    take_over_my_home = true,

    -- auto-set telekasten filetype: if false, the telekasten filetype will not be used
    --                               and thus the telekasten syntax will not be loaded either
    auto_set_filetype = true,

    -- template for new notes (new_note, follow_link)
    -- set to `nil` or do not specify if you do not want a template
    template_new_note = tk_home .. '/' .. 'templates/new_note.md',

    -- template for newly created daily notes (goto_today)
    -- set to `nil` or do not specify if you do not want a template
    template_new_daily = tk_home .. '/' .. 'templates/daily.md',

    -- template for newly created weekly notes (goto_thisweek)
    -- set to `nil` or do not specify if you do not want a template
    template_new_weekly= tk_home .. '/' .. 'templates/weekly.md',

    -- command palette theme: dropdown (window) or ivy (bottom panel)
    command_palette_theme = "dropdown",

    -- tag list theme:
    -- get_cursor: small tag list at cursor; ivy and dropdown like above
    show_tags_theme = "dropdown",

    -- when linking to a note in subdir/, create a [[subdir/title]] link
    -- instead of a [[title only]] link
    subdirs_in_links = true,

    -- template_handling
    template_handling = "prefer_new_note",

    -- path handling:
    new_note_location = "prefer_home",

    -- should all links be updated when a file is renamed
    rename_update_links = true,
  })

-- Calendar VIM

  use {
    'renerocksai/calendar-vim',
    requires = {'renerocksai/calendar-vim'}
  }

-- BibTex
use { "nvim-telescope/telescope-bibtex.nvim",
  requires = {
    {'nvim-telescope/telescope.nvim'},
  },
  config = function ()
    require"telescope".load_extension("bibtex")
  end,
}


require"telescope".setup {
  extensions = {
    bibtex = {
      -- Depth for the *.bib file
      depth = 1,
      -- Custom format for citation label
      custom_formats = {},
      -- Format to use for citation label.
      -- Try to match the filetype by default, or use 'plain'
      format = '',
      -- Path to global bibliographies (placed outside of the project)
      global_files = {},
      -- Define the search keys to use in the picker
      search_keys = { 'author', 'year', 'title' },
      -- Template for the formatted citation
      citation_format = '{{author}} ({{year}}), {{title}}.',
      -- Only use initials for the authors first name
      citation_trim_firstname = true,
      -- Max number of authors to write in the formatted citation
      -- following authors will be replaced by "et al."
      citation_max_auth = 2,
      -- Context awareness disabled by default
      context = false,
      -- Fallback to global/directory .bib files if context not found
      -- This setting has no effect if context = false
      context_fallback = true,
      -- Wrapping in the preview window is disabled by default
      wrap = false,
    },
  }
}



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
