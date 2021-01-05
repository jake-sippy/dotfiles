"--------------------------------------------------------------------
" VIMRC MUST HAVES
"--------------------------------------------------------------------
set nocompatible            " Don't keep compatability with vi
set clipboard+=unnamedplus
filetype indent plugin on   " Smart file indenting
syntax enable               " Enable syntax highlighting
set termguicolors
:au FocusLost * silent! wa  " Autosave on focuslost

"--------------------------------------------------------------------
" PLUGINS
"--------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'honza/vim-snippets'

" Javascript plugins
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'tomtom/tcomment_vim'
Plug 'takac/vim-hardtime'
Plug 'lervag/vimtex'
  let g:vimtex_view_method='zathura'
  let g:vimtex_quickfix_mode=0


call plug#end()

" Viewing
colorscheme badwolf
autocmd FileType * setlocal tw=80

"Latex
autocmd FileType * hi clear Conceal
set conceallevel=2
let g:tex_flavor='latex'
let g:tex_conceal='abdgm'


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
set notimeout ttimeout ttimeoutlen=5

" Allow backspacing over autoindent
set backspace=indent,eol,start

"--------------------------------------------------------------------
" INDENTATION OPTIONS
"--------------------------------------------------------------------
set expandtab         " Tab becomes spaces
set tabstop=2         " Tab is 2 spaces long
set shiftwidth=2      " Spaces for autoindent
set softtabstop=2     " Tab -> spaces width

"--------------------------------------------------------------------
" COC CONFIG
"--------------------------------------------------------------------
let g:python3_host_prog='/home/jsippy/.anaconda3/envs/nvim/bin/python'
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-pyright',
  \ 'coc-eslint',
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-styled-components',
  \ 'coc-prettier',
  \ 'coc-spell-checker',
  \ ]

set nobackup          " Don't backup files
set nowritebackup     " "
set updatetime=300    " Time until plugins see change
set shortmess+=c      " Don't pass messages to ins-completion-menu.
set signcolumn=yes    " merge signcolumn and number

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"--------------------------------------------------------------------
" MAPPINGS
"--------------------------------------------------------------------

" Yank whole line
map Y y$

" Oops i missed the esc button
:map <F1> <Esc>
:imap <F1> <Esc>

"--------------------------------------------------------------------
" UN-MAPPINGS
"--------------------------------------------------------------------

" Disable Ex mode
:map Q <nop>

" Disable middle click paste
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
