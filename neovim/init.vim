call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'wojciechkepka/vim-github-dark'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'
Plug 'danro/rename.vim'
Plug 'sudar/comments.vim'
Plug 'morhetz/gruvbox'
call plug#end()

"github soft theme
"let g:gh_color="soft"

set number
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

set background=dark

" italics
let &t_ZH="\e[3m"
let &t_ZH="\e[23m"
" File browser
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'


"vim-airline smarter tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep= '>'
let g:airline#extensions#tabline#left_alt_sep= '|'
let g:airline#extensions#tabline#formatter= 'unique_tail'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_italic=1


colorscheme gruvbox
" Create file without opening buffer
function! CreateInPreview()
  let l:filename = input('please enter filename: ')
  execute 'silent !touch ' . b:netrw_curdir.'/'.l:filename
  redraw!
endfunction

" Netrw create file using touch instead of opening a buffer
function! Netrw_mappings()
  noremap <buffer>% :call CreateInPreview()<cr>
endfunction

augroup auto_commands
    autocmd filetype netrw call Netrw_mappings()
augroup END

"File browser
let NERDTreeShowHidden=1

"Language Server stuff
command! -nargs=0 Prettier :call CocAction('runCommand','prettier.formatFile')

" Normal mode remappings
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :8split<CR>:terminal<CR>
nnoremap <F8> :set background=light<CR>
nnoremap <F9> :set background=dark<CR>


" Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt 
nnoremap <silent> <S-t> :tabnew<CR> 
" Insert Mode remappings
" Tab enters first auto complete suggestion
inoremap <expr> <TAB> coc#pum#visible() ? coc#_select_confirm() : "<TAB>"
" Enter also does same
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

"comments.vim / key mapping for single comment line in normal mode
nnoremap <silent> <C-L> :call CommentLine()<CR>
"and multi comment line in visual mode
vnoremap <silent> <C-L> :call RangeCommentLine()<CR>
"comments.vim / key mapping for uncommenting single line in normal mode
nnoremap <silent> <C-J> :call UnCommentLine()<CR>
"and uncomment multiple lines in visual mode
vnoremap <silent> <C-J> :call RangeUnCommentLine()<CR>


" Auto commands
augroup auto_commands
  autocmd FileType scss setlocal iskeyword+=@-@
augroup END

"let g:PaperColor_Theme_Options = {
  ""\   'theme': {
  ""\     'default.dark': {
  ""\       'transparent_background': 0
  ""\     }
  ""\   }
  ""\ }
" -------Indentation
" length of an actual \t character:
set tabstop=2
" length to use when editing text (eg. TAB and BS keys)
" (0 for ‘tabstop’, -1 for ‘shiftwidth’):
set softtabstop=0
" length to use when shifting text (eg. <<, >> and == commands)
" (0 for ‘tabstop’):
set shiftwidth=2
" round indentation to multiples of 'shiftwidth' when shifting text
" (so that it behaves like Ctrl-D / Ctrl-T):
set shiftround

" if set, only insert spaces; otherwise insert \t and complete with spaces:
set expandtab

" reproduce the indentation of the previous line:
set autoindent
" keep indentation produced by 'autoindent' if leaving the line blank:
"set cpoptions+=I
" try to be smart (increase the indenting level after ‘{’,
" decrease it after ‘}’, and so on):
set smartindent
" a stricter alternative which works better for the C language:
"set cindent
" use language‐specific plugins for indenting (better):
set termguicolors
filetype plugin indent on
syntax on
"------------------------------

:map \p i(<Esc>$a)<Esc>   "insert parentheses starting at the cursor position and upto end of line
:map \c i{<Esc>$a}<Esc>   "insert curly brackets starting at the cursor position and upto end of line
:map \s i[<Esc>$a]<Esc>   "insert square brackets starting at the cursor position and upto end of line
":map <F2> <Esc>:tabprevious<Esc>
":map <F3> <Esc>:tabnext<Esc>
"packadd vimball
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" for coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

" open nerdtree on startup and shift focus to the other window
 autocmd VimEnter * NERDTree 
" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
"packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
