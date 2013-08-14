" set mouse=a " enable mouse in all modes
" set list "shows whether tabs or spaces are used

" visual elements

set autoindent

" The number of spaces used for each step of (auto)indent
" These options get reset by devel-vimrc for certain file types, i.e. python
set shiftwidth=4    " autoindenting width
set tabstop=4
set softtabstop=4
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab        " insert blanks instead of tabs at the front of a line
set expandtab       " use spaces instead of tabs (%retab converts them!)
set number

set nocompatible    " nocp, disable vi compatibility mode. ATTENTION: Changing this may change A LOT!
set backspace=2     " see :h 'backspace';  '2 same as :set backspace=indent,eol,start'
set noscrollbind    " scroll behavior when there are two or more windows that might have scrollbind active:
                    " TRUE means window/buffer B will also scroll when
                    " window/buffer A is scrolled

set hlsearch        " hilight search results
set ignorecase      " ignore case when searching ...
set smartcase       " only when all letters are lowercase!
set incsearch       " show search matches as you type

set ruler           " display line and column number, and the relative curser position

set history=1000    " remember some more commands ...
set undolevels=1000 " and undo level

set hidden          "don't close, but hide buffers

let &t_Co=256

colorscheme desert
" colorscheme ir_black

autocmd BufNewFile,Bufread *.php,*.php3,*.php4 set keywordprg="phelp"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/


" automatically save and load views!
au BufWinLeave * mkview
au BufWinEnter * silent! loadview

" activate html snippets for php files, too ...
au BufRead,BufNewFile *.php set ft=php.html

nmap :Wq :wq
nmap :W :w

set number
nnoremap <F2> :set nonumber!<CR>
set pastetoggle=<F4>

nmap <F8> :TagbarToggle<CR>
nmap <F5> :NERDTreeToggle<CR>

set laststatus=2 " enables the status line at the bottom of vim
" set statusline=\f\i\l\e\:\ %f\ %m\ \|\ \P\o\s\:%l\ %v\ \|\ %{GitBranchInfoString()}
set statusline=\f\i\l\e\:\ %f\ %m\ \|\ \P\o\s\:%l\ %v\ \|\
let g:git_branch_status_head_current=1
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin on
helptags ~/.vim/doc

" lets you save files that must be edited as super user/root
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
set number
nnoremap <F2> :set nonumber!<CR>

noremap <leader>bd :Bclose<CR>
noremap <leader>bl :ls<CR>
noremap <leader>bn :bn<CR>
noremap <leader>bp :bp<CR>
noremap <leader>bt :b#<CR>
noremap <leader>bx :Bclose!<CR>

inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

"folding settings
" set foldmethod=indent   "fold based on indent
" set foldnestmax=10      "deepest fold is 10 levels
" set nofoldenable        "dont fold by default
" set foldlevel=1         "this is just what i use

map ,f :set foldmethod=indent<cr>zM<cr>
map ,F :set foldmethod=manual<cr>zR<cr>

:set tags=~/.vim/tags/ctags
:set shell=/bin/bash
