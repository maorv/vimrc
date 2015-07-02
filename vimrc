"source $VOODOO_ROOT_DIR/vim/settings.vim

set wildignore+=*/build_unittest/*,*.o,*.mod.c,*.order,*.ko,*.o.d

" change AWK default parmaters
if !exists("g:ackprg")
  let s:ackcommand = executable('ack-grep') ? 'ack-grep' : 'ack'
  let g:ackprg=s:ackcommand." -H --nocolor --nogroup --column  --ignore-file=is:tags"
endif

" Setup vundle plugins manager
set runtimepath+=~/.vim/vundle/
call vundle#rc( "~/.vim/bundle" )
source ~/.vim/plugins.vim

"Remove trailing spaces and replace tabs with spaces on save
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre *.hpp :%s/\s\+$//e
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre *.c :%s/\s\+$//e

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
"let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
set laststatus=2

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" config the vim module CtrlP:
let g:ctrlp_map = '<F12>'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|build|build_unittest|logs.whiteboxtest)$',
  \ 'file': '\v\.(so|pyc|swp|exe|bat|jar|zip|bz2|tar|sqlite)$',
  \ }
" Set no max file limit
let g:ctrlp_max_files = 0
" " Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

syntax on
filetype indent plugin on
filetype on
filetype plugin on
"Override indentation rules for C++ files
let g:c_syntax_for_h = 1
au FileType cpp setl tabstop=4
au FileType cpp setl shiftwidth=4
au FileType cpp setl expandtab

map <F6> :Colin<CR>
"Fast movement in the location list:
map <C-j> :cn<CR>
map <C-k> :cp<CR>

"Fast movement in the buffer list:
map <C-h> :bp<CR>
map <C-l> :bn<CR>
map <M-Right> :bn^M
map <M-Left> :bp^M

"Fast movement for next/previous tags
map #8 :tp^M
map #9 :tn^M

"Fast movement between splits
map <M-Down> ^W^W
map <M-Up> ^WW

if has("gui_running")
	set background=dark
	colorscheme solarized
	"colorscheme blackboard 
	set guifont=Monospace\ 14
endif

command! Ctags !ctags --exclude=build --exclude=build_unittest --exclude=tools -R .

"Override NewFile
command! NewFile %!python ~/.vim/newfile.py %
