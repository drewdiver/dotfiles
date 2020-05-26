" (N)VIM Setup

set shortmess=I " disable startup message
set t_Co=256 " 256 colors please
color zenburn
" set background=light
set visualbell " no noise, only flash screen
set showcmd " display incomplete commands
set hidden " hide buffer instead of closing
set colorcolumn=81
set wrap
" set nowrap " disable soft wrap for lines
" set tw=90 " wrap at 90 columns
set linebreak
set laststatus=2 " always show the status line
syntax enable " syntax highlighting
set expandtab " spaces instead of tabs
set tabstop=2 "number of visual spaces per tab
set shiftwidth=2 " number of spaces inserted for indentation
set softtabstop=2 " number of spaces in a tab when editing
set number " show line numbers
set splitbelow " new splits set to bottom or right side of screen
set splitright
set showmatch " show matching parens, etc
set incsearch " incremental search
set hlsearch " highlight the results
set ignorecase
set smartcase
set paste
set undolevels=1000	" number of undo levels
set backspace=indent,eol,start " backspace behaviour
set ruler " show row and column ruler information
set guicursor+=i:blinkon0 " disable blinking cursor in insert mode
set guicursor+=n-v-c:blinkon0 " disable blinking cursor in normal, visual and command mode
set statusline=%=%m\ %c\ %P\ %f\ %n
filetype plugin on

let mapleader="\<Space>" " use Space instead of '\'

call plug#begin('~/.local/share/nvim/plugged') " vimplug
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " fuzzy search
Plug 'tmhedberg/SimpylFold' " code folding
Plug 'mattn/emmet-vim' " HTML completions
Plug 'terryma/vim-multiple-cursors' " name says it all
Plug 'vim-scripts/bash-support.vim' " couldn't live without this!
Plug 'itchyny/lightline.vim' " better status line
Plug 'tpope/vim-surround' " change surrounding characters
Plug 'airblade/vim-gitgutter' " add some git info to nvim
Plug 'preservim/nerdtree' " file browser
Plug 'tpope/vim-commentary' " comment stuff out!
Plug 'freitass/todo.txt-vim' " better todo.txt handling
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()

" re-mappings
map ; :Files<CR>
nnoremap gV `[v`] " highlight last inserted text
nnoremap j gj
nnoremap k gk
nnoremap <leader>w :w<CR>
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left> " replace word under cursor

" open file with cursor at last save point
if has("autocmd") 
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" move lines around
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

" buffer management
nnoremap <leader>B :enew<cr> " create a new buffer
nnoremap <leader>bq :bp <bar> bd! #<cr> " close current buffer
nnoremap <leader>ba :bufdo bd!<cr> " close all open buffers
nnoremap <Tab> :bnext<cr> " switch to next open buffer
nnoremap <S-Tab> :bprevious<cr> " switch to previous open buffer
nnoremap <leader><leader> <c-^> " cycle between last two open buffers
nnoremap <leader>bl :Buffers<cr> 

" shortcuts
nnoremap <Leader>gy :Goyo<CR>
nnoremap <leader>ve :e ~/dotfiles/_config/nvim/init.vim<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>
nnoremap <leader>td :e ~/todo.txt<CR>
map <leader>l :set cursorline! cursorline?<CR>
map <leader>n :NERDTreeToggle<CR>
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
map <F3> :set relativenumber! relativenumber?<CR>
map <F4> :set cursorcolumn! cursorcolumn?<CR>
map <F5> :call ToggleCC()<CR>

" Goyo
" Handy: https://josh.blog/2017/04/writing-mode-vim
function! s:auto_goyo()
    if &ft == 'markdown' && winnr('$') == 1
        Goyo 80
    elseif exists('#goyo')
        Goyo!
    endif
endfunction

function! s:goyo_leave()
    if winnr('$') < 2
        silent! :q
    endif
endfunction

augroup goyo_markdown
    autocmd!
    autocmd BufNewFile,BufRead * call s:auto_goyo()
    autocmd! User GoyoLeave nested call goyo_leave()
augroup END


" limelight
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

" lightline config | seoul256
let g:lightline = {
 	\ 'colorscheme': 'seoul256'
\}

