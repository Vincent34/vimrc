set number
set showmatch
set nocompatible
set autoindent
set smartindent
set tags=tags
set autochdir
set ts =4
set sw =4
set ruler
language messages none
set langmenu=none
color slate
set ignorecase
set backspace=indent,eol,start
set guifont=Arial_monospaced_for_SAP:h10:cANSI
set guifont=Consolas:h10
set foldmethod=indent
set encoding=utf-8
syntax on
filetype off
filetype indent on

filetype plugin indent on
set completeopt=longest,menu

autocmd Filetype python set omnifunc=pythoncomplete#Complete
autocmd Filetype html set omnifunc=htmlcomplete#CompleteTags
autocmd Filetype xml set omnifunc=xmlcomplete#CompleteTags
autocmd Filetype javascript set omnifunc=javascriptcomplete#CompleteJS

map <F12> :e $VIM\_vimrc <cr>
map<c-a> ggVG
function! Compile()
	exec "w"
	if &filetype == "cpp"
		exec "!g++ -g -o %<.exe % -std=gnu++11 -Wall"
	endif
	if &filetype == "c"
		exec "!gcc -g -o %<.exe % -Wall"
	endif
	if &filetype == "tex" || &filetype == "plaintex" || &filetype == "context"
		exec "!xelatex %"
	endif
	if &filetype == "java"
		exec "!javac %"
	endif
endfunc

function! Run()
	exec "w"
	if &filetype == "cpp" || &filetype == "pascal"
		exec "!%<.exe"
	endif
	if &filetype == "c"
		exec "!%<.exe"
	endif
	if &filetype == "python"
		exec "!python %"
	endif
	if &filetype == "sh"
		exec "!bash %"
	endif
	if &filetype == "tex" || &filetype == "plaintex" || &filetype == "context"
		exec "!start %<.pdf"
	endif
	if &filetype == "html"
		exec "!chrome C:/Users/Administrator/%"
	endif
	if &filetype == "java"
		exec "!java %<"
	endif
endfunc

function! Debug()
	exec "w"
	if &filetype == "cpp" || &filetype == "pascal" ||&filetype == "c"
		exec "!gdb %<"
	endif
	if &filetype == "python"
		exec "!python -m pdb %"
	endif
endfunc

imap<F5> <esc>:call Debug()<cr>
map<F5> <esc>:call Debug()<cr>
vmap<F5> <esc>:call Debug()<cr>

imap<F8> <esc>:call Run()<cr>
map<F8> <esc>:call Run()<cr>
vmap<F8> <esc>:call Run()<cr>

imap<F9> <esc>:call Compile()<cr>
map<F9> <esc>:call Compile()<cr>
vmap<F9> <esc>:call Compile()<cr>

"----------------Plugin-------------------------
set rtp+=$VIM\vimfiles\bundle\Vundle.vim
call vundle#begin('$VIM/vimfiles/bundle/')
" let Vundle manage Vundle  
" required!   
Plugin 'VundleVim/Vundle.vim'
  
" 可以通过以下四种方式指定插件的来源  
" a) 指定Github中vim-scripts仓库中的插件，直接指定插件名称即可，插件明中的空格使用“-”代替。  
Plugin 'L9'
  
" b) 指定Github中其他用户仓库的插件，使用“用户名/插件名称”的方式指定  
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mileszs/ack.vim'
"Plugin 'Valloric/YouCompleteMe'

" c) 指定非Github的Git仓库的插件，需要使用git地址  
" Bundle 'git://git.wincent.com/command-t.git'  
  
" d) 指定本地Git仓库中的插件  
" Bundle 'file:///Users/gmarik/path/to/plugin' 
"
" ----------------------tagbar------------------------
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=30
map<F3> :Tagbar<cr>

"-----------------------NERDTree----------------------
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
map<F2> :NERDTreeToggle<cr>

"-----------------------vim-airline-------------------
set laststatus=2

"---------------------minibufexpl.vim-----------------
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplMoreThanOne=0

"------------nerdtree-git----------------------------
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"------------YouCompleteMe---------------------------
"let g:ycm_python_binary_path = 'python'
