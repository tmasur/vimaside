set nocompatible		" stay allways vimproved
set noexpandtab			" tabs consist of tabs and no spaces
set tabstop=4			" use width of 4 spaces for tab
set shiftwidth=4		" use indentation width of 4 spaces
set smartindent			" better indentation than autoindent
set encoding=utf-8		" the encoding displayed in vim
set fileencoding=utf-8	" the encoding written to file
set fileformat=unix		" store file in unix format to prevent a bunch of
                        " conversion issues when working with GitHub
set noswapfile			" no annoying swapfiles
set scrolloff=8			" keep the cursor more centered
set signcolumn=yes		" displays signs in the column for the numbers
set wildmenu			" suggestions are displayed
set showmatch			" show the matching pair of brackets
set splitbelow			" more intuitive splitbehaviour for :sp
set splitright			" more intuitive splitbehaviour for :vs
set number				" show linenumbers
set relativenumber		" show numbers in a relative way
set visualbell			" combined with the next line no beep and
set visualbell t_vb=	" no flash will occur
set hidden				" switch buffer without the necessary of :w and so on
set undodir=~/.vim/undo	" set directory for undos (permissions are set to 700)
set undofile			" activate undofile
set undolevels=3000		" number of changes that can be undone
set viminfo='1000,n$HOME/.viminfo " remember file informations
filetype on				" read filetype.vim at startup and sets the autocmds
syntax enable			" activate syntax highlighting
colorscheme pablo		" use the colorscheme pablo
set colorcolumn=81		" maker that helps to use only 80 columns
set textwidth=80		" line length doesn’t go beyond 80 characters
set laststatus=2		" allways show the statusline
set showmode			" show current mode in command-line
set showcmd				" show already typed keys when more are expected
set cursorline			" find the current line quicker

" set the color for the column 81 marker
highlight ColorColumn ctermbg=brown

" show trailing whitespace and spaces before a tab
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/

" set the comment color
highlight Comment ctermfg=darkcyan

" set linenumber color
highlight LineNr ctermfg=brown
highlight cursorline ctermbg=black cterm=bold
highlight cursorlinenr ctermfg=yellow cterm=bold

" set the color for the statusline
highlight StatusLine ctermbg=brown ctermfg=yellow

" set color of visual selection
highlight visual ctermbg=brown ctermfg=yellow

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=" "		" set leadermap to whitespace

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" substitutes all occurencies of the word under the cursor in the file
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" change char to lower or upper case and hold the current cursor position
nnoremap ~ ~<Left>

" exit insert mode and hold the current cursor position
inoremap jk <Esc><Right>

" put selection in quotes and parentheses
vnoremap ' s''<Esc>P<Right>
vnoremap " s""<Esc>P<Right>
vnoremap ( s()<Esc>P<Right>
vnoremap ) s()<Esc>P<Right>
vnoremap [ s[]<Esc>P<Right>
vnoremap ] s[]<Esc>P<Right>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')	" vim plugin manager - vim-plug
Plug 'pbondoer/vim-42header'		" creates vim header for 42 projects
Plug 'SirVer/ultisnips'				" for snippets
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" restore the cursor postition when reopening files
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \	execute "normal! g`\"" |
    \ endif

" deactivate cursorline option, when in insert mode
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" UltiSnips trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"	" if :UltiSnipsEdit should split your window
