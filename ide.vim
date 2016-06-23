function! Compile()
	exec "w"
	if &filetype == "cpp"
		exec "!g++ -std=c++11 -g -o %< % -Wall"
	endif
	if &filetype == "c"
		exec "!gcc -g -o %< % -Wall"
	endif
	if &filetype == "pascal"
		exec "!fpc -g %"
	endif
	if &filetype == "tex" || &filetype == "plaintex" || &filetype == "context"
		exec "!xelatex %"
	endif
endfunc

function! Run()
	exec "w"
	if &filetype == "cpp" || &filetype == "pascal" || &filetype == "c"
		exec "!./%<"
	endif
	if &filetype == "python"
		exec "!python %"
	endif
	if &filetype == "sh"
		exec "!bash %"
	endif
	if &filetype == "tex" || &filetype == "plaintex" || &filetype == "context"
		exec "!evince %<.pdf"
	endif
	if &filetype == "html"
		exec "!google-chrome %"
	endif
	if &filetype == "ruby"
		exec "!ruby %"
	endif
	if &filetype == "haskell"
		exec "!runghc %"
	endif
endfunc

function! Debug()
	exec "w"
	if &filetype == "cpp" || &filetype == "pascal"
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
