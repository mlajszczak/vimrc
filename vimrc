set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'easymotion/vim-easymotion'

Plugin 'tpope/vim-surround'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'scrooloose/nerdTree'

Plugin 'rking/ag.vim'

Plugin 'altercation/vim-colors-solarized'

Plugin 'sjl/gundo.vim'

Plugin 'Lokaltog/vim-powerline'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-fireplace'

Plugin 'kien/rainbow_parentheses.vim'

Plugin 'lepture/vim-velocity'

Plugin 'dleonard0/pony-vim-syntax'

Plugin 'rust-lang/rust.vim'

Plugin 'lambdatoast/elm.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" Reasonable tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Backspace config
set backspace=indent,eol,start

" Always show the statusline
set laststatus=2

" Visual autocomplete for command menu
set wildmenu

" Search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Hide buffers instead of closing them
set hidden

" Ignore case when searching
set ignorecase
set smartcase

" Remember more commands and search history
set history=200

" Change the terminal's title
set title

" Don't fuck up intendation when pasting
set pastetoggle=<F2>

" Most important mappings
let mapleader = ","
imap jj <Esc>

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Show line numbers
" With easy-motion relativenumber is no longer needed
set number

" Highlight syntax
syntax on

" Highlight matching parenthesis
set showmatch

" *.swp files are annoying
set noswapfile

" Use solarized colors
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized

" Set different scheme for diff
highlight DiffAdd    cterm=bold ctermfg=193 ctermbg=29
highlight DiffDelete cterm=bold ctermfg=234 ctermbg=167
highlight DiffChange cterm=bold ctermfg=193 ctermbg=130
highlight DiffText   cterm=bold ctermfg=193 ctermbg=4

" Allow to insert empty line in normal mode
nnoremap <silent><leader>o o<Esc>k
nnoremap <silent><leader>O O<Esc>j

" Map NERDTree to '<Leader>nt'
noremap <Leader>nt :NERDTree<CR>

" Shortcut for opening .vimrc
noremap <Leader>ev :vsp <C-r>=resolve(expand("~/.vimrc"))<CR><CR>

" Shortcut for opening .bashrc
noremap <Leader>eb :vsp <C-r>=resolve(expand("~/.bashrc"))<CR><CR>

" Shortcut for opening .zshrc
noremap <Leader>ez :vsp <C-r>=resolve(expand("~/.zshrc"))<CR><CR>

" Shortcut for sourcing .vimrc
nnoremap <leader>sv :source ~/.vimrc<CR>

" Save session
nnoremap <leader>s :mksession!<CR>

" Open ag.vim
nnoremap <leader>aa :Ag!<space>-S<space>
nnoremap <leader>ajj :Ag!<space>--java<space>-S<space>
nnoremap <leader>ass :Ag!<space>--css<space>-S<space>
nnoremap <leader>ajs :Ag!<space>--js<space>-S<space>
nnoremap <leader>ajc :Ag!<space>--cpp<space>-S<space>

" Switch between relativenumber and number
nnoremap <leader>tn :call ToggleNumber()<CR>

" Run gundo
nnoremap <leader>u :GundoToggle<CR>

" Split windows settings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>- :resize -20<CR>
nnoremap <leader>+ :resize +20<CR>
nnoremap <leader>< :vertical resize -30<CR>
nnoremap <leader>> :vertical resize +30<CR>

" Run ctrlp in mru mode
nnoremap <leader>m :CtrlPMRU<CR>

" Toggle last buffer
nnoremap <leader>tt <C-^>

" fugitive mappings
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>du :diffupdate<cr>

" switch to/from hex
nnoremap <leader>h :%!xxd<cr>
nnoremap <leader>hr :%!xxd -r<cr>

" ctrlp settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.git$',
    \ 'link': 'build',
    \ }
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*\|.*\.git.*'
let g:ctrlp_max_files = 0
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_working_path_mode = 'a'

" rainbow_parenthesis autocmd for clojure
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" Toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Strips trailing whitespace at the end of files
nnoremap <leader>tw :call <SID>StripTrailingWhitespaces()<cr>
function! <SID>StripTrailingWhitespaces()
    " Save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" Display preview window properly (not above active one)
autocmd BufEnter ?* call DisplayPreviewWindowFullWidth()
function! DisplayPreviewWindowFullWidth()
  if &previewwindow
    exec 'wincmd K'
  endif
endfunc
