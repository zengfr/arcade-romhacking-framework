#!/usr/bin/python  
# -*- coding:utf-8 -*-
# (c) 2016  XingXing(HappyASR#gmail.com)
# (c) 2020  zengfr(362505707#qq.com)(https://github.com/zengfr)
import os
import re
import sys

def patch_file(crosstools,fileelf,filemap,fileori,fileout):
	print 'patch_file processing',fileelf,filemap,fileori,fileout
	map_list = []
	for c in open(filemap,'r').readlines():
		if c.startswith('.rom'):
			c=c.strip(' ').strip('\n')
			c=re.split('\s*',c)
			rom_base = int(c[1],16)
		if '__patch_end_' in c or '__patch_start_' in c:
			c=c.strip(' ').strip('\n')
			c=re.split('\s*',c)
			map_list.append( (int(c[0],16)-rom_base,c[1]) )
			print c
	map_list.sort()
	print map_list
	
	if os.path.exists("rom.bin"):
		os.remove("rom.bin")
	if os.path.exists("ram.bin"):
		os.remove("ram.bin")
	print "objcopy objdump start"
	os.system( "%sobjcopy.exe -Obinary -j.rom %s rom.bin" % (crosstools,fileelf))
	os.system( "%sobjcopy.exe -Obinary -j.ram %s ram.bin" % (crosstools,fileelf))
	os.system( "%sobjdump.exe -C -S %s > %s.patch.asm" % (crosstools,fileelf,fileelf))
	dat_pat = open("rom.bin",'rb').read()+open("ram.bin",'rb').read()
	
	dat_ori = open(fileori,'rb').read()
	len_ori = len(dat_ori)
	#dat_pat = open(filerom,'rb').read()+open(fileram,'rb').read()

	for i in range(len(map_list)/2):
		pat_start = map_list[2*i][0]
		pat_end = map_list[2*i+1][0]
		if(pat_end!=pat_start):
			print "%x-%x %s" % (pat_start,pat_end,dat_pat[pat_start:pat_end].encode('hex'))
			dat_ori = dat_ori[:pat_start]+dat_pat[pat_start:pat_end]+dat_ori[pat_end:] 
	dat_ori = dat_ori[:map_list[-1][0]]+dat_pat[map_list[-1][0]:]+dat_ori[len(dat_pat):]
	print "%x %x %x" % (map_list[-1][0],map_list[-1][0],len(dat_pat))
	len_now = len(dat_ori)
	dat_ori += '\xFF'*(len_ori-len_now)
	open(fileout,'wb').write(dat_ori)
	print "Saved OK.",fileout

if __name__=='__main__':
	if len(sys.argv)>5:
		patch_file(sys.argv[1],sys.argv[2],sys.argv[3],sys.argv[4],sys.argv[5])
	else:
		print "%s <CROSS-PREFIX> <ELF> <MAP> <ORI_BIN> <OUTPUT>" % sys.argv[0]
		sys.exit(1)