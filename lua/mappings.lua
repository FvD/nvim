-- vim.cmd('noremap <C-b> :noh<cr>:call clearmatches()<cr>') -- clear matches Ctrl+b

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end
-- 
-- -- sane regexes
-- nmap('/', '/\\v')
-- vmap('/', '/\\v')
-- 
-- -- don't jump when using *
-- nmap('*', '*<c-o>')
-- 
-- -- keep search matches in the middle of the window
-- nmap('n', 'nzzzv')
-- nmap('N', 'Nzzzv')
-- 
-- -- Same when jumping around
-- nmap('g;', 'g;zz')
-- --nmap('g', 'g,zz') -- for some reason doesn't work well
-- 
-- -- Open a Quickfix window for the last search.
-- nmap("<leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")
-- 
-- -- Begining & End of line in Normal mode
-- nmap('H', '^')
-- nmap('L', 'g_')
-- 
-- -- more natural movement with wrap on
-- nmap('j', 'gj')
-- nmap('k', 'gk')
-- vmap('j', 'gj')
-- vmap('k', 'gk')
-- 
-- -- Easy buffer navigation
-- nmap('<C-h>', '<C-w>h')
-- nmap('<C-j>', '<C-w>j')
-- nmap('<C-k>', '<C-w>k')
-- nmap('<C-l>', '<C-w>l')
-- 
-- -- Reselect visual block after indent/outdent
-- vmap('<', '<gv')
-- vmap('>', '>gv')
-- 
-- -- home and end line in command mode
-- cmap('<C-a>', '<Home>')
-- cmap('<C-e>', '<End>')
-- 
-- -- Terminal
-- -- ESC to go to normal mode in terminal
tmap('<C-s>', '<C-\\><C-n>')
tmap('<Esc><Esc>', '<C-\\><C-n>')
-- 
-- -- Easy window split; C-w v -> vv, C-w - s -> ss
-- nmap('vv', '<C-w>v')
-- nmap('ss', '<C-w>s')
-- vim.o.splitbelow = true -- when splitting horizontally, move coursor to lower pane
-- vim.o.splitright = true -- when splitting vertically, mnove coursor to right pane
-- 
-- -- PLUGINS
-- 
-- -- Find files using Telescope command-line sugar.
vim.cmd([[
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
]])
-- 
-- -- LSP Saga
nmap('K', '<cmd>Lspsaga hover_doc<cr>')
imap('<C-k>', '<cmd>Lspsaga hover_doc<cr>')
nmap('gh', '<cmd>Lspsaga lsp_finder<cr>')
nmap('<C-e>', '<cmd>Lspsaga show_line_diagnostics<CR>')

-- -- LSP
vim.cmd([[
  set completeopt=menuone,noselect

  " Use <Tab> and <S-Tab> to navigate through popup menu
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
  nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

  " Auto format using LSP on save
  autocmd BufWritePre *go,*.py lua vim.lsp.buf.formatting_sync(nil, 100)
]])
-- -- git
-- nmap('<C-g>', '<cmd>GitMessenger<cr>')
