"--------------------------------------------------------------------
" VIMRC MUST HAVES
"--------------------------------------------------------------------
set nocompatible            " Don't keep compatability with vi
filetype indent plugin on   " Smart file indenting
syntax enable               " Enable syntax highlighting

"--------------------------------------------------------------------
" PLUGINS
"--------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes'

Plug 'vim-airline/vim-airline'

Plug 'tomtom/tcomment_vim'

Plug 'takac/vim-hardtime'

Plug 'lervag/vimtex'
  let g:vimtex_view_method='zathura'
  let g:vimtex_quickfix_mode=0

" Plug 'sirver/UltiSnips'
"   let g:UltiSnipsExpandTrigger="<tab>"
"   let g:UltiSnipsJumpForwardTrigger="<c-b>"
"   let g:UltiSnipsJumpBackwardTrigger="<c-z>"

call plug#end()

" Viewing
colorscheme badwolf
autocmd FileType * setlocal tw=80

"Latex
autocmd FileType * hi clear Conceal
set conceallevel=2
let g:tex_flavor='latex'
" let g:tex_conceal='abdgm'
let g:tex_conceal='abgm'


"--------------------------------------------------------------------
" USABILITY OPTIONS
"--------------------------------------------------------------------

set autoindent        " Keep same indent when returning
set nostartofline     " Remove default movement to startofline
set ruler             " Display the cursor position
set laststatus=2      " Always display the status line
set confirm           " Instead of failing raise a dialogue
set visualbell        " Use visual bell instead of beeping
set t_vb=             " Reset the terminal code for the visual bell
set mouse=a           " Enable use of the mouse for all modes
set cmdheight=2       " Set the command window height to 2 lines
set number            " Display line numbers on the left
" set relativenumber    " Display line numbers relavtive to cursor line
set pastetoggle=<F12> " Use <F12> to toggle 'paste'
set ignorecase        " Case insensitive search
set smartcase         " Case sensitive if capitals are used
set hlsearch          " Highlight searches
set splitbelow        " Preview window at the bottom
set hidden            " Don't destroy buffers
set wildmenu          " Better command-line completion
set showcmd           " Show partial commands
set encoding=utf-8    " Use UTF-8 for displaying vim

" Quickly time out on keycodes, but never on mappings
set notimeout ttimeout ttimeoutlen=200

" Allow backspacing over autoindent
set backspace=indent,eol,start

"--------------------------------------------------------------------
" INDENTATION OPTIONS
"--------------------------------------------------------------------
set expandtab         " Tab becomes spaces
set shiftwidth=2      " Spaces for autoindent
set softtabstop=2     " Tab -> spaces width

"--------------------------------------------------------------------
" MAPPINGS
"--------------------------------------------------------------------

map Y y$
:map <F1> <Esc>
:imap <F1> <Esc>

" Remove trailing whitespace with <F5>
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"--------------------------------------------------------------------
" UN-MAPPINGS
"--------------------------------------------------------------------

" Disable Ex mode
:map Q <nop>

" Disable middle click paste
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
