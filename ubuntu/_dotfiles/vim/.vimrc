" ========== Plugin Configuration ==========
" ***** Visual *****
" Enable syntax highlighting
syntax on
syntax enable
filetype plugin indent on

" Disable regexp syntax highlight to avoid performance issues
" in syntax highlighting large files
set regexpengine=0

" Render <TAB> character to equal 2 columns
set tabstop=2

" Set vim to show number
set number

" Highlight current line
set cursorline

" :Explore is using list style
let g:netrw_liststyle=3

" ***** General *****
" No swap file
set noswapfile

" Tabs are spaces
set expandtab

" Number of tabs indentation in insert mode, when we actually hit <TAB>
set softtabstop=2

" How many indentations when using >> and <<
set shiftwidth=2

" Bind space as leader key
let mapleader = "\<Space>"

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd=

" Zoom a vim pane, C-w to rebalance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Bind ctrl-s to write to file
nmap <C-s> :w<cr>

" Bind Ctrl-n to file tree (the :Explore) toggle
nmap <C-n> :e .<cr> 

" Bind Ctrl-S and Enter in Insert mode to get out from insert mode
imap <C-s> <esc>:w<CR>

" Bind Ctrl-S and Enter in Visual mode to get out from visual mode
xmap <C-s> <esc>:w<CR>

" Make j and k movement in normal mode to travel like normal in texts that are
" wrapped by vim, try travelling this long comment line and see why it is more
" reasonable to map it like this
nmap k gk
nmap j gj

" See :set filetype? to check what is current filetype
autocmd FileType javascript,typescript setlocal commentstring=//\ %s
autocmd FileType javascriptreact,typescriptreact setlocal commentstring={/*\ %s\ */}

" Use TAB to complete when typing words, else inserts TABs as usual.
" https://vim.fandom.com/wiki/Autocomplete_with_TAB_when_typing_words
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" Vim copy to system clipboard
set clipboard^=unnamed,unnamedplus

" Set vim backspace to behave like in most other programs
set backspace=indent,eol,start

" Set autoindent when entering newline
set autoindent

" Ocaml stuff
set rtp^="/Users/christiansakai/.opam/cs3110-2021fa/share/ocp-indent/vim"

