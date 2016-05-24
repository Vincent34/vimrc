set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

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

