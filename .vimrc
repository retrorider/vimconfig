"Personal Settings.
"More to be added soon/
execute pathogen#infect()
filetype plugin indent on
syntax on
"Set the status line options. Make it show more information.
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}  
"set statusline=%{fugitive#statusline()}
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
let g:auto_save = 1  " enable AutoSave on Vim startup
"Set Color Scheme and Font Options
colorscheme kolor
set guifont=Consolas:h10
"Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"End Personal Settings.



function! SetDiffEnviron()
  set diff
  set scrollbind
  set scrollopt=ver,jump,hor
  set nowrap
  set fdm=diff
endfunction
:command! SetDiffEnviron call SetDiffEnviron() 
"Filename Completion Options
" Wildmenu
if has("wildmenu")
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildmenu
    set wildmode=longest,list
endif
inoremap <Tab> <C-X><C-F>

set fileformats=unix,dos
set fileformat=unix

"set line no, buffer, search, highlight, autoindent and more.
set nu
set hidden
set ignorecase
set incsearch
set smartcase
set showmatch
set autoindent
set ruler
set vb
set viminfo+=n$VIM/_viminfo
set noerrorbells
set showcmd
set mouse=a
set history=1000
set undolevels=1000

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" let g:vimwiki_list = [{'path':'C:\Users\jdavis2\Dropbox\vimwiki', 'path_html':'C:\Users\jdavis2\Dropbox\vimwiki_html'},{'path':'C:\Users\jdavis2\Dropbox\vimwiki\BRPC', 'path_html':'C:\Users\jdavis2\Dropbox\vimwiki_html'}]
let g:vimwiki_list = [{'path':'/cygdrive/c/Users/jdavis2/Dropbox/vimwiki', 'path_html':'/cygdrive/c/Users/jdavis2/Dropbox/vimwiki_html'},{'path':'/cygdrive/c/Users/jdavis2/Dropbox/vimwiki/BRPC', 'path_html':'/cygdrive/c/Users/jdavis2/Dropbox/vimwiki_html'}]

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

set thesaurus+=$HOME/Thesaurus/mthesaur.txt

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

