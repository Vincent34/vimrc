import re

def Expand(st):
	n = len(st)
	last = n - 1
	if (n < 7): return st
	s = 0
	ret = []
	pos = 0
	if (st[n - 1] != ')'):
		return st
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
		
	if (s != 0 or pos < 3 or len(ret) != 2): return st
	ret.append(st[pos + 1:last])
	for i in range(0,len(ret)):
		if (not len(ret[i])): return st
		ret[i] = ret[i].strip()
	if (st[pos - 3:pos] != "rep"): return st
	if (pos != 3 and (re.compile("[a-zA-Z_]").search(st[pos - 4]))): return st
	return st[:pos - 3] + "for (int %s = %s; %s <= %s; %s++)"%(ret[2], ret[1], ret[2], ret[0], ret[2])

if __name__ == "__main__":
	St = raw_input()
	print Expand(St)
