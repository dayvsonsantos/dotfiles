" vim-plug configuration
call plug#begin('~/.vim/plugged')
    Plug 'lfv89/vim-interestingwords'
call plug#end()

" vundle configuration
set nocompatible
filetype off                  
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'davidhalter/jedi-vim'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'tpope/vim-surround'
    Plugin 'scrooloose/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'w0rp/ale' " # pep8 
call vundle#end()            
filetype plugin indent on   

"keymap - general
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
imap jk <Esc>
imap kj <Esc>

"avoid creation of swap files
set noswapfile

"edit setting
set nowrap          "lines can be greater than shell width(maybe necessary to scroll horizontally)
set rnu             "enable relative number
syntax enable       "enable highlight
colorscheme monokai "enable monokai theme
set tabstop=4       "tab equals 4 spaces
set shiftwidth=4    "indent new line INSERT mode
set expandtab       "fill tabs with space
set autoindent      "indent new line NORMAL mode
set smartindent     "indent according to text style
set cursorline
set mousefocus
set splitbelow
set splitright

"style - bottom line
set title           "show filename as title of status bar
set ruler           "enabe ruler of status bar
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%) "show date and time in status bar"

"enable vim resize with mouse
set mouse+=a
if &term =~ '^screen'
    set ttymouse=xterm2
endif

map <C-n> :NERDTreeToggle<CR>

set foldmethod=indent
" Keep all folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END

"-- AUTOCLOSE --
""autoclose and position cursor to write text inside
inoremap ' ''<left>
inoremap ` ``<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
"autoclose with ; and position cursor to write text inside
inoremap '; '';<left><left>
inoremap `; ``;<left><left>
inoremap "; "";<left><left>
inoremap (; ();<left><left>
inoremap [; [];<left><left>
inoremap {; {};<left><left>
"autoclose with , and position cursor to write text inside
inoremap ', '',<left><left>
inoremap `, ``,<left><left>
inoremap ", "",<left><left>
inoremap (, (),<left><left>
inoremap [, [],<left><left>
inoremap {, {},<left><left>
"autoclose and position cursor after
inoremap '<tab> ''
inoremap `<tab> ``
inoremap "<tab> ""
inoremap (<tab> ()
inoremap [<tab> []
inoremap {<tab> {}
"autoclose with ; and position cursor after
inoremap ';<tab> '';
inoremap `;<tab> ``;
inoremap ";<tab> "";
inoremap (;<tab> ();
inoremap [;<tab> [];
inoremap {;<tab> {};
"autoclose with , and position cursor after
inoremap ',<tab> '',
inoremap `,<tab> ``,
inoremap ",<tab> "",
inoremap (,<tab> (),
inoremap [,<tab> [],
inoremap {,<tab> {},
"autoclose 2 lines below and position cursor in the middle 
inoremap '<CR> '<CR>'<ESC>O
inoremap `<CR> `<CR>`<ESC>O
inoremap "<CR> "<CR>"<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap {<CR> {<CR>}<ESC>O
"autoclose 2 lines below adding ; and position cursor in the middle 
inoremap ';<CR> '<CR>';<ESC>O
inoremap `;<CR> `<CR>`;<ESC>O
inoremap ";<CR> "<CR>";<ESC>O
inoremap (;<CR> (<CR>);<ESC>O
inoremap [;<CR> [<CR>];<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"autoclose 2 lines below adding , and position cursor in the middle 
inoremap ',<CR> '<CR>',<ESC>O
inoremap `,<CR> `<CR>`,<ESC>O
inoremap ",<CR> "<CR>",<ESC>O
inoremap (,<CR> (<CR>),<ESC>O
inoremap [,<CR> [<CR>],<ESC>O
inoremap {,<CR> {<CR>},<ESC>O
