function! Expand()
python << endpython
#import autoexpand.py
import vim
import re


def pyExpand(st):
	n = len(st)
	last = n - 1
	if (n < 7): return st + "\t"
	s = 0
	ret = []
	pos = 0
	if (st[n - 1] != ')'):
		return st + "\t"
	for i in range(n - 1, -1, -1):
		if (st[i] == ')'):
			s += 1
		if (st[i] == '('):
			s -= 1
		if (st[i] == ',' and s == 1):
			ret.append(st[i + 1:last])
			last = i
		if (s == 0):
			pos = i
			break
		
	if (s != 0 or pos < 3 or (len(ret) != 2 and len(ret) != 1)): return st + "\t"
	ret.append(st[pos + 1:last])
	for i in range(0,len(ret)):
		if (not len(ret[i])): return st + "\t"
		ret[i] = ret[i].strip()
	if (st[pos - 3:pos] != "rep"): return st + "\t"
	if (pos != 3 and (re.compile("[a-zA-Z_]").search(st[pos - 4]))): return st + "\t"
	if (len(ret) == 2):
		return st[:pos - 3] + "for (int %s = 1; %s <= %s; %s++) "%(ret[1], ret[1], ret[0], ret[1])
	else:
		return st[:pos - 3] + "for (int %s = %s; %s <= %s; %s++) "%(ret[2], ret[1], ret[2], ret[0], ret[2])


def SPexpand(st):
	n = len(st)
	if (n < 3): return st + "\t"
	if (st[n - 1] != ')'): return st + "\t"
	ret = []
	pos = n - 2
	s = 0
	for i in range(n - 2, -1, -1):
		if (st[i] == ')'): s += 1
		if (s == 0 and (st[i] == ',' or st[i] == '(')):
			tmp = st[i + 1:pos + 1]
			ret.append(tmp.strip())
			pos = i - 1
			if (st[i] == '('): break
		if (st[i] == '('): s -= 1
	if (pos < 0 or pos != 0 and re.compile("[A-Za-z_]").search(st[pos - 1]) or st[pos] != 'S' and st[pos] != 'P'): return st + "\t"
	ret.reverse()
	Ans = ""
	if (st[pos] == 'S'): Ans = 'scanf("'
	else: Ans = 'printf("'
	for i in range(0, len(ret) - 1): 
		Ans += "%d"
		if (st[pos] == 'P'):
			Ans += ' '
	if (len(ret)): Ans += '%d'
	if (st[pos] == 'S'):
		Ans += '", '
		for i in ret:
			Ans += "&"  + i + ", "
		if (len(ret)): Ans = Ans[:-2]
		Ans += ");"
	else:
		Ans += '\\n", '
		for i in ret:
			Ans += i + ", "
		if (len(ret)): Ans = Ans[:-2]
		Ans += ");"
	return st[:pos] + Ans

def Trans(st):
	ss = ""
	for i in range(0, len(st)):
		if (st[i] == "'"): ss += "'"
		ss += st[i]
	return ss

st = vim.eval("getline('.')")
vim.command('echo "%s"'%(st))
backup = st
pos = int(vim.eval("col('.')"))
ss = st[pos:]
st = pyExpand(backup[:pos])
if (backup + "\t" == st):
	st = SPexpand(backup[:pos])
st += ss
st = Trans(st)
vim.command("call setline('.', '%s')"%(st))
vim.command("call cursor(0, %d)"%(pos + len(st) - len(backup)))
endpython
endfunc

autocmd BufNewFile,BufRead *.cpp inoremap <tab> <esc>:call Expand()<cr>a
