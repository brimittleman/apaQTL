#!/usr/bin/env python


def main(inFile, outFile):
	fout = open(outFile,'w')
	for ind,ln in enumerate(open(inFile)):
		#print(ind)
		chrom, start, end, count = ln.split()
		i2=int(start)
		while i2 < int(end):
			#print("test")
			fout.write("%s\t%d\t%s\n"%(chrom, i2+ 1, count))
			fout.flush()
			i2 += 1
	fout.close()

if __name__ == "__main__":
	import numpy as np
	from misc_helper import *
	import sys
	inFile = sys.argv[1]
	outFile = sys.argv[2]
	main(inFile, outFile)
