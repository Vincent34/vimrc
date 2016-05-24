filetype indent on
filetype plugin indent on
set completeopt=longest,menu
set nu
syntax enable
syntax on
color elflord
set nowrap
set guioptions+=b
set autoindent
set cin
set sw=4
set ts=4
set fdm=indent
let g:tex_flavor = "latex"
command Check !python check.py %<
map<F12> <esc>:e ~/.vimrc<cr>
map<c-a> ggVG
set encoding=utf-8
set fileencodings=utf-8,gb18030,gb2312,gbk
"modify key of snipmate
