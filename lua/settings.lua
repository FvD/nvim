HOME = os.getenv("HOME")

-- basic settings
vim.opt.shell = "/bin/zsh"
vim.opt.mouse= "a"
vim.opt.lbr = true
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.lisp = true
vim.opt.diffopt = "vertical"

vim.cmd([[
set guitablabel=\[%N\]\ %t\ %M 
  set shortmess+=I
  filetype plugin indent on 
  filetype on
  let @m="i %>%\r  "
  set guioptions=agim
  set guioptions-=e
]])


vim.cmd([[
  au FileType python                  set ts=4 sw=4
  au BufRead,BufNewFile *.md          set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.ppmd        set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.markdown    set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.slimbars    set syntax=slim
]])

-- Commands mode
-- vim.o.wildmenu = true -- on TAB, complete options for system command
-- vim.o.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'

-- Only show cursorline in the current window and in normal mode.
vim.cmd([[
  augroup cline
      au!
      au WinLeave * set nocursorline
      au WinEnter * set cursorline
      au InsertEnter * set nocursorline
      au InsertLeave * set cursorline
  augroup END
]])

vim.o.background = 'dark'
vim.cmd('colorscheme nightfox')

vim.cmd([[
  "------------------------------------
  " Showmarks
  "------------------------------------
  let marksCloseWhenSelected = 0
  let showmarks_include="abcdefghijklmnopqrstuvwxyz"
]])

vim.cmd([[
"------------------------------------
" Set R filetypes
"------------------------------------
" Copied from the vim-r-plugin ftdetect file
autocmd BufNewFile,BufRead *.Rprofile set ft=r
autocmd BufRead *.Rhistory set ft=r
autocmd BufNewFile,BufRead *.r set ft=r
autocmd BufNewFile,BufRead *.R set ft=r
autocmd BufNewFile,BufRead *.s set ft=r
autocmd BufNewFile,BufRead *.S set ft=r

autocmd BufNewFile,BufRead *.Rout set ft=rout
autocmd BufNewFile,BufRead *.Rout.save set ft=rout
autocmd BufNewFile,BufRead *.Rout.fail set ft=rout

autocmd BufNewFile,BufRead *.Rrst set ft=rrst
autocmd BufNewFile,BufRead *.rrst set ft=rrst

autocmd BufNewFile,BufRead *.Rmd set ft=rmd
autocmd BufNewFile,BufRead *.rmd set ft=rmd
" vim-r-plugin settings
let vimrplugin_assign_map = "<M-->"


"------------------------------------
" Set R tabstops to 2
"------------------------------------
autocmd FileType r setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType rmd setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType rnoweb setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType rdoc setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType rrst setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType rmd setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 expandtab

" Lines added by the Vim-R-plugin command :RpluginConfig (2014-Jun-04 08:48):
filetype plugin on

"------------------------------------
" Set R tabstops to 2
" from: http://vim.wikia.com/wiki/Diff_current_buffer_and_the_original_file
"------------------------------------
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
]])


-- TODO: Replace with lua
vim.cmd([[
" ----------------------------------------------------------
" Look for long lines
" ----------------------------------------------------------
map <F2> :/\%>80v.\+<CR>

" ----------------------------------------------------------
" the silver searcher
" ----------------------------------------------------------
let g:ag_working_path_mode="r"
]])

-- TODO: Replace with lua
-- vim.cmd([[
-- " ----------------------------------------------------------
-- " fill rest of line with characters
-- " from http://stackoverflow.com/questions/3364102/
-- "   \how-to-fill-a-line-with-character-x-up-to-column-y-using-vim
-- " ----------------------------------------------------------
-- "function! FillLine( str )
-- "    " set tw to the desired total length
-- "    let tw = &textwidth
-- "    if tw==0 | let tw = 78 | endif
-- "    " strip trailing spaces first
-- "    .s/[[:space:]]*$//
-- "    " calculate total number of 'str's to insert
-- "    let reps = (tw - col("$")) / len(a:str)
-- "    " insert them, if there's room, removing trailing spaces (though forcing
-- "    " there to be one)
-- "    if reps > 0
-- "        .s/$/\=(' '.repeat(a:str, reps))/
-- "    endif
-- "endfunction
-- "
-- "nmap <silent> <F3> :call FillLine('#')<CR>
-- "nmap <silent> <S-F3> :call FillLine('%')<CR>
-- "
-- "
-- ":tnoremap <Esc> <C-\><C-n>
-- "
-- "" To align lines with brackets to the left
-- "let r_indent_align_args = 0
-- "
-- "" Stop indenting on brackets (especially for written text / non-code)
-- "nmap <F4>:set noai<CR>
-- ]])


-- Vim slime_target
vim.cmd([[
  "==============================
  " VIM Slime
  " =============================
  let g:slime_target = "neovim"
]])


-- Nvim-R plugin
vim.cmd([[
  let g:markdown_fenced_languages = ['r', 'python']
  let g:rmd_fenced_languages = ['r', 'python']

  let vimrplugin_never_unmake_menu = 1
  let vimrplugin_objbr_place = "console,right"
  let vimrplugin_openpdf = 1
  let rrst_syn_hl_chunk = 1
  let rmd_syn_hl_chunk = 1
  let R_assign = 0
  let R_pdfviewer="zathura"

  if $DISPLAY != ""
      let vimrplugin_openpdf = 1
      let vimrplugin_openhtml = 1
  endif

  if has("gui_running")
      inoremap <C-Space> <C-x><C-o>
  else
      inoremap <Nul> <C-x><C-o>
  endif
  vmap <Space> <Plug>RDSendSelection
  nmap <Space> <Plug>RDSendLine
]])


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  fox = "nightfox", -- Which fox style should be applied
  transparent = true, -- Disable setting the background color
  alt_nc = false, -- Non current window bg to alt color see `hl-NormalNC`
  terminal_colors = true, -- Configure the colors used when opening :terminal
  styles = {
    comments = "NONE", -- Style that is applied to comments: see `highlight-args` for options
    functions = "NONE", -- Style that is applied to functions: see `highlight-args` for options
    keywords = "NONE", -- Style that is applied to keywords: see `highlight-args` for options
    strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
    variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
  },
  inverse = {
    match_paren = false, -- Enable/Disable inverse highlighting for match parens
    visual = false, -- Enable/Disable inverse highlighting for visual selection
    search = false, -- Enable/Disable inverse highlights for search highlights
  },
  colors = {}, -- Override default colors
  hlgroups = {}, -- Override highlight groups
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()


