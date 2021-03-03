#!/usr/bin/python  
# -*- coding:utf-8 -*-
# (c) 2016  XingXing(HappyASR#gmail.com)
# (c) 2020  zengfr(362505707#qq.com)(https://github.com/zengfr)
TOKEN_PATCH = 'XXPATCH'
import os
import re
import sys

#return (org,file,line,str)
def process_asm(filename):
	resp = []
	print 'process_asm', filename
	dat = open(filename).read()
	dat = re.sub('//[ \t]*'+TOKEN_PATCH, '//$$PATCH', dat)
	dat = dat.split(TOKEN_PATCH)
	resp.append( (0,filename,0,dat[0]) )
	linecount = dat[0].count('\n')
	for c in dat[1:]:
		c = c.strip(' ').strip('\t')
		org_str = c.split('(')[1].strip()
		org_str = re.compile(r'[), ]').split(org_str)[0]
		if org_str[:2]=='0x':
			org_val = int(org_str,16)&0xfffffff
		else:
			org_val = int(org_str)&0xfffffff
		resp.append( (org_val,filename,linecount,'\t'+TOKEN_PATCH+c) )
		linecount += c.count('\n')
	return resp

def gen_patch(addr_code,outfile,inpdir):
	print "gen_patch outfile=%s" % outfile
	basepathlen = len(outfile)-len('patch.S')
	patch_all = []
	for f in inpdir:
		patch_all.extend( process_asm(f) )

	patch_all.sort()
	f = open(outfile,'w+')
	f.write('''
#include "../../include/xxpacth_include.h"
.section .patch,"ax"

XXEXPORT_START(dumpy)

''')
	for c in patch_all:
	    #print c
		f.write('.file "%s"\n' % c[1][basepathlen:].replace('\\','\\\\'))
		f.write('.line %d\n' % c[2])
		f.write(c[3]+'\n')

	f.write('.file __FILE__\n')
	f.write('.line __LINE__\n')
	f.write('XXEXPORT_END(dumpy)\n')
	f.write('.org %s\n' % addr_code)
	f.write('XXEXPORT_START(ccodeabc)\n')
	f.close()

if __name__=='__main__':
	gen_patch(sys.argv[1],sys.argv[2],sys.argv[3:])
