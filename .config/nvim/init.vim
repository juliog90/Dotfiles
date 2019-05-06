"remove automatic line comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"always expanded gutter
set signcolumn=yes
"split bottom and right
set splitright
set splitbelow
"clipboard access
set clipboard=unnamed
"real colors
set termguicolors
"config parameters
set number 
set relativenumber
set autoindent
" set smartindent
set incsearch
"tabs 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4
" javascript and html identation
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
"auto closing parentheses
" inoremap j


"Enable Autocompletion
autocmd FileType php setlocal omnifunc=phpactor#Complete

"ripgrep
nnoremap <leader>a :Rg<space>
nnoremap <leader>A :exec "Rg ".expand("<cword>")<cr>

"mini yank plugin
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <leader>n <Plug>(miniyank-cycle)
map <Leader>c <Plug>(miniyank-tochar)
map <Leader>l <Plug>(miniyank-toline)
map <Leader>b <Plug>(miniyank-toblock)

"close buffer cool plugin
map <Leader>q :Bdelete<CR>
map <Leader>q :Bwipeout<CR>

autocmd VimEnter * command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
"' Auto StartNerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"ctags plugin
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &
"plugin example
"Plug 'tpope/vim-fugitive'
"plugin manager
call plug#begin()

"Document Tree
Plug 'scrooloose/nerdtree'

"Mini-Yank
Plug 'bfredl/nvim-miniyank'

"Close Buffer
Plug 'moll/vim-bbye'

"Commentary
Plug 'tpope/vim-commentary'

"Better Substitution
Plug 'tpope/vim-abolish'

"Separate Configuration per project
Plug 'amiorin/vim-project'
Plug 'mhinz/vim-startify'

"PHP"
"Syntax Highlighting
Plug 'StanAngelOff/php.vim'

"Auto Formatter
Plug 'stephpy/vim-php-cs-fixer'

"Auto Completition
"Engine
Plug 'ncm2/ncm2'

"YouCompleteme
Plug 'Valloric/YouCompleteMe/', {'do': './install.py'}

"tab completition
Plug 'ajh17/VimCompletesMe'

"tab completition
Plug 'ajh17/VimCompletesMe'

"tab completition
Plug 'ajh17/VimCompletesMe'

"StatusBar"
Plug 'itchyny/lightline.vim'

"PHP Especific
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'roxma/ncm-phpactor'

"Search and Replace
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'wincent/ferret'
Plug 'ctrlpvim/ctrlp.vim'

"Code Quality
Plug 'neomake/neomake'

"Refactoring
Plug 'adoy/vim-php-refactoring-toolbox'

"Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Outline
Plug 'majutsushi/tagbar'

"Debugger
Plug 'joonty/vdebug'

"Documentation
Plug 'tobyS/vmustache'
Plug 'tobyS/pdV'

"Themes
Plug 'kaicataldo/material.vim'

"Emmet
Plug 'mattn/emmet-vim'

"Javascript Plugin
Plug 'pangloss/vim-javascript'

"Auto Close Parenthesis
Plug 'cohama/lexima.vim'

"Linter (error highlighter)
Plug 'w0rp/ale'

"Color Picker
Plug 'KabbAmine/vCoolor.vim'

"Color in hex codes and stuff
Plug 'lilydjwg/colorizer'

"More repeat with 
Plug 'tpope/vim-repeat'

"Sorround 
Plug 'tpope/vim-surround'

call plug#end()
" pluginend

"theme
set background=dark
let g:material_theme_style = 'dark'
colorscheme material
let g:lightline = { 'colorscheme': 'material_vim' }

"startify
" :h startify
":h startify-faq

"nerd tree theme
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nmap <C-T> :NERDTreeToggle<CR> 
let NERDTreeQuitOnOpen = 1

"php fixer
" let g:php_cs_fixer_path = "~/php/php-cs-fixer-v2.phar"
let g:php_cs_fixer_rules = "@PSR2"       

"debugger stuff
let g:vdebug_options ={'break_on_open':0}
"C++ shortcuts
"javascript syntax hightlighting
let g:javascript_plugin_jsdoc = 1

"UtilSnips Fix YouCompleteMe
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

"javascript eslint

let g:ale_javascript_eslint_use_global = 1
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

" fuzzy finder ctrlp shortcut
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" ctrlp hidden files
let g:ctrlp_show_hidden = 1

