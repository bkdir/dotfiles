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
set t_Co=256
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
" set cinkeys=
set comments=
"set indentkeys=
set tildeop

set cpoptions-=u

set splitright
set splitbelow
set noshowmode

" speed up syntax highlighting
set nocursorcolumn

" Completion window max size
set pumheight=10

set noshowmatch

" to enable project specific .vimrc configuration
set exrc
set secure

" =============== Mapping

map ,rs :!clear; rspec %<CR>
map <LocalLeader>s :exe "!clear; rspec %"<CR>
map <LocalLeader>cs :exe "!clear; rspec ".expand("%").":".line(".")<CR>
map ,cr :!clear; ruby -cw %<CR>

" Shift+q pops up a 'close buffers' menu to delete buffers
nnoremap Q :CloseBuffersMenu<CR>
" Ctrl+C moves to next buffer, deletes the current one
nnoremap <C-c> :bp\|bd #<CR>

" ===============  CommandT

let g:CommandTAcceptSelectionSplitMap=['<CR>', '<C-i>']
let g:CommandTWildIgnore=&wildignore . ",*.swp,*.jpg,log,node_modules,tags,tmp,vendor,webpack"
let g:CommandTNeverShowDotFiles=1
let g:CommandTScanDotDirectories=0

" Autocompletion
imap <Tab> <C-n>
imap <S-Tab> <C-p>

"JS syntax highlight
"if (has("termguicolors"))
"  set termguicolors
"endif

"colorscheme OceanicNext

" =============== auto commands

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END

augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>
  autocmd FileType help wincmd L

  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.html setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2

  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
augroup END

" =============== NERDTree

" make it visible by default
" au VimEnter *  NERDTree
" focus on to the actual window, not NERDTree
" au VimEnter * NERDTree | wincmd p
" F5 toggles NERDTree window
nmap <F5> :NERDTreeToggle<CR>

" =============== The Silver Searcher
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

" =============== syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_go_checkers = ['gofmt','golint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" =============== vim-airline

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#branch#prefix     = '⤴'
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'
let g:airline_symbols.branch    = '⎇'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1

" ===================== vim-go

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
