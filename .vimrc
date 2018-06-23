" Not sure if this is used, but keep it here anyway
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
" apparently, using vim over vi if the option/command available on both
set nocompatible

" copy to clipboard
set clipboard=unnamed

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype on
filetype indent on
filetype plugin on

" will include all plugins under ~/.vim/bunlde folder
execute pathogen#infect()
call pathogen#helptags()

syntax on
set background=dark
colorscheme solarized

" Allows you to work with multiple files in one window without having to save changes
set hidden
set number
"
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" highlight all search patterns
set hlsearch
set incsearch

" will highlight matching paranthesis
" set showmatch

" to update windows not in focuse once you have multiple windows
set winwidth=96
"set winheight=30
"set winminheight=14

set fileencoding=utf-8
set encoding=utf-8

"backspace works as expected
set backspace=indent,eol,start

"Re-arrange the color of line numbers and Searched words
highlight LineNr cterm=bold ctermfg=2 ctermbg=8
highlight Search term=standout ctermfg=9 ctermbg=0

" Always display the status line, even if only one window is displayed
set laststatus=2
set statusline=%<\ %f\ %m%r%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\%)
hi StatusLine cterm=none ctermbg=257 ctermfg=8

" Use visual bell instead of beeping when doing something wrong
set visualbell

"highlights the whole line
set cursorline
" https://github.com/vim/vim/issues/282
set re=1
"show options, better command-line completion
set wildmenu

" tabspace insert spaces when you hit tab
" shiftwidth is the number of spaces for each indentation
set ts=2
set sw=2
set expandtab

" by default all substitutions will be global. i.e :s///
set gdefault

set colorcolumn=90
set wc=<tab>
set wildmode=longest,full

set history=40
set nobackup
set nowritebackup

" DoMatchParen
set cinkeys=
set comments=
"set indentkeys=
set tildeop

set cpoptions-=u

" -------------------- Mapping
map ,rs :!clear; spring rspec %<CR>
map ,cr :!clear; ruby -cw %<CR>

" Shift+q pops up a 'close buffers' menu to delete buffers
nnoremap Q :CloseBuffersMenu<CR>
" Ctrl+C moves to next buffer, deletes the current one
nnoremap <C-c> :bp\|bd #<CR>

let g:CommandTAcceptSelectionSplitMap=['<CR>', '<C-i>']
let g:CommandTWildIgnore=&wildignore . ",*.swp,*.jpg,log,node_modules,tags,tmp,vendor,webpack"
let g:CommandTNeverShowDotFiles=1
let g:CommandTScanDotDirectories=0

" Autocompletion
imap <Tab> <C-n>
imap <S-Tab> <C-p>

" --------------------- NERDTree

" make it visible by default
" au VimEnter *  NERDTree
" focus on to the actual window, not NERDTree
" au VimEnter * NERDTree | wincmd p
" F5 toggles NERDTree window
nmap <F5> :NERDTreeToggle<CR>

" ---------------------- The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag over ack
  let g:ackprg = 'ag --vimgrep --nogroup --nocolor --column'

  " bind K to grep word under cursor
  " nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>
  nnoremap K :Ack! <cword><CR>

  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
  " by defauly, ack opens the first file, Ack! lists all options
  cnoreabbrev Ack Ack!
end

set noshowmatch
